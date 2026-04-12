package main

import (
	"fmt"
	"os"
	"path/filepath"

	"github.com/BurntSushi/toml"
	tea "github.com/charmbracelet/bubbletea"
)

type Config struct {
	Packages PackagesConfig
	Configs  ConfigsConfig
}

type PackagesConfig struct {
	Brew []string
	App  []string
}

type ConfigsConfig struct {
	Symlink map[string]string
	App     map[string]string
}

func main() {
	exe, err := os.Executable()
	if err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(1)
	}
	exe, err = filepath.EvalSymlinks(exe)
	if err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(1)
	}
	repoRoot := filepath.Dir(exe)
	tomlPath := filepath.Join(repoRoot, "symlink-paths.toml")
	configsDir := filepath.Join(repoRoot, "configs")

	var cfg Config
	if _, err := toml.DecodeFile(tomlPath, &cfg); err != nil {
		fmt.Fprintf(os.Stderr, "failed to parse %s: %v\n", tomlPath, err)
		os.Exit(1)
	}

	packages, symlinks := gatherStatus(cfg, configsDir)

	p := tea.NewProgram(newModel(packages, symlinks))
	finalModel, err := p.Run()
	if err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(1)
	}

	m := finalModel.(model)
	if m.cancelled {
		fmt.Println("Cancelled.")
		os.Exit(0)
	}

	applyChanges(m.symlinks, configsDir)
}
