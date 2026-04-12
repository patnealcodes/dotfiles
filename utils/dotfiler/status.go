package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

type ItemKind int

const (
	KindBrewPkg ItemKind = iota
	KindAppPkg
	KindSymlink
)

type LinkStatus int

const (
	StatusNotLinked LinkStatus = iota
	StatusLinkedCorrect
	StatusLinkedWrong
	StatusRealFile
)

type Item struct {
	Name        string
	Kind        ItemKind
	TargetPath  string
	SourcePath  string
	DisplayPath string
	Status      LinkStatus
	Installed   bool
	Selected    bool
}

func expandHome(path string) string {
	if strings.HasPrefix(path, "~/") {
		home, _ := os.UserHomeDir()
		return filepath.Join(home, path[2:])
	}
	return path
}

func contractHome(path string) string {
	home, _ := os.UserHomeDir()
	if strings.HasPrefix(path, home) {
		return "~" + path[len(home):]
	}
	return path
}

func gatherStatus(cfg Config, configsDir string) ([]Item, []Item) {
	var packages []Item
	var symlinks []Item

	// Check brew packages concurrently — brew is slow to invoke
	type brewResult struct {
		name      string
		installed bool
	}
	brewCh := make(chan brewResult, len(cfg.Packages.Brew))
	for _, pkg := range cfg.Packages.Brew {
		go func(p string) {
			brewCh <- brewResult{name: p, installed: isBrewInstalled(p)}
		}(pkg)
	}
	for range cfg.Packages.Brew {
		r := <-brewCh
		packages = append(packages, Item{
			Name:      fmt.Sprintf("[brew] %s", r.name),
			Kind:      KindBrewPkg,
			Installed: r.installed,
		})
	}

	for _, app := range cfg.Packages.App {
		installed := isAppInstalled(app)
		packages = append(packages, Item{
			Name:      fmt.Sprintf("[app] %s", app),
			Kind:      KindAppPkg,
			Installed: installed,
		})
	}

	for name, target := range cfg.Configs.Symlink {
		target = expandHome(target)
		source := filepath.Join(configsDir, name)
		status := checkSymlink(target, source)

		symlinks = append(symlinks, Item{
			Name:        name,
			Kind:        KindSymlink,
			TargetPath:  target,
			SourcePath:  source,
			DisplayPath: contractHome(target),
			Status:      status,
			Selected:    status == StatusNotLinked,
		})
	}

	return packages, symlinks
}

func isBrewInstalled(pkg string) bool {
	err := exec.Command("brew", "list", pkg).Run()
	return err == nil
}

func isAppInstalled(app string) bool {
	_, err := os.Stat(fmt.Sprintf("/Applications/%s.app", app))
	return err == nil
}

func checkSymlink(targetPath, expectedSource string) LinkStatus {
	info, err := os.Lstat(targetPath)
	if os.IsNotExist(err) {
		return StatusNotLinked
	}
	if err != nil {
		return StatusNotLinked
	}

	if info.Mode()&os.ModeSymlink != 0 {
		dest, err := os.Readlink(targetPath)
		if err != nil {
			return StatusLinkedWrong
		}
		dest, _ = filepath.Abs(dest)
		src, _ := filepath.Abs(expectedSource)
		if dest == src {
			return StatusLinkedCorrect
		}
		return StatusLinkedWrong
	}

	return StatusRealFile
}
