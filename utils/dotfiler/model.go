package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"

	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"
)

var (
	titleStyle    = lipgloss.NewStyle().Bold(true).Foreground(lipgloss.Color("99"))
	selectedStyle = lipgloss.NewStyle().Foreground(lipgloss.Color("212"))
	dimStyle      = lipgloss.NewStyle().Foreground(lipgloss.Color("241"))
	checkStyle    = lipgloss.NewStyle().Foreground(lipgloss.Color("42"))
	warnStyle     = lipgloss.NewStyle().Foreground(lipgloss.Color("214"))
)

type model struct {
	packages []Item
	symlinks []Item
	cursor   int
	cancelled bool
}

func newModel(packages, symlinks []Item) model {
	return model{packages: packages, symlinks: symlinks}
}

func (m model) Init() tea.Cmd {
	return nil
}

func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {
	case tea.KeyMsg:
		switch msg.String() {
		case "q", "esc", "ctrl+c":
			m.cancelled = true
			return m, tea.Quit

		case "enter":
			return m, tea.Quit

		case "up", "k":
			if m.cursor > 0 {
				m.cursor--
			}

		case "down", "j":
			if m.cursor < len(m.symlinks)-1 {
				m.cursor++
			}

		case " ":
			m.symlinks[m.cursor].Selected = !m.symlinks[m.cursor].Selected
		}
	}
	return m, nil
}

func (m model) View() string {
	var b strings.Builder

	b.WriteString(titleStyle.Render("dotfiler"))
	b.WriteString("\n\n")

	b.WriteString(titleStyle.Render("Packages"))
	b.WriteString("\n")
	for _, item := range m.packages {
		icon := warnStyle.Render("✗")
		if item.Installed {
			icon = checkStyle.Render("✓")
		}
		b.WriteString(fmt.Sprintf("  %s %s\n", icon, item.Name))
	}

	b.WriteString("\n")
	b.WriteString(titleStyle.Render("Config Locations"))
	b.WriteString("\n")
	for i, item := range m.symlinks {
		cursor := "  "
		if m.cursor == i {
			cursor = selectedStyle.Render("> ")
		}

		check := "[ ]"
		if item.Selected {
			check = checkStyle.Render("[✓]")
		}

		status := statusLabel(item)

		b.WriteString(fmt.Sprintf("%s%s %s %s\n", cursor, check, item.Name, status))
	}

	hasConflicts := false
	for _, item := range m.symlinks {
		if item.Status == StatusLinkedWrong || item.Status == StatusRealFile {
			hasConflicts = true
			break
		}
	}
	if hasConflicts {
		b.WriteString("\n")
		b.WriteString(warnStyle.Render("  Conflicts detected — remove existing files/symlinks before linking."))
	}

	b.WriteString("\n")
	b.WriteString(dimStyle.Render("space=toggle  enter=apply  q=quit"))
	b.WriteString("\n")

	return b.String()
}

func statusLabel(item Item) string {
	path := dimStyle.Render("`" + item.DisplayPath + "`")
	switch item.Status {
	case StatusLinkedCorrect:
		return checkStyle.Render("(linked") + " - " + path + checkStyle.Render(")")
	case StatusLinkedWrong:
		return warnStyle.Render("(conflict: linked → wrong target") + " - " + path + warnStyle.Render(")")
	case StatusRealFile:
		return warnStyle.Render("(conflict: real file exists") + " - " + path + warnStyle.Render(")")
	default:
		return dimStyle.Render("(not linked" + " - " + "`" + item.DisplayPath + "`" + ")")
	}
}

func applyChanges(symlinks []Item, configsDir string) {
	applied := 0
	for _, item := range symlinks {
		if !item.Selected {
			continue
		}
		if item.Status == StatusLinkedCorrect {
			continue
		}

		parent := filepath.Dir(item.TargetPath)
		if err := os.MkdirAll(parent, 0o755); err != nil {
			fmt.Fprintf(os.Stderr, "  error creating dir %s: %v\n", parent, err)
			continue
		}

		if item.Status != StatusNotLinked {
			fmt.Printf("  removing existing: %s\n", item.TargetPath)
			if err := os.RemoveAll(item.TargetPath); err != nil {
				fmt.Fprintf(os.Stderr, "  error removing %s: %v\n", item.TargetPath, err)
				continue
			}
		}

		if err := os.Symlink(item.SourcePath, item.TargetPath); err != nil {
			fmt.Fprintf(os.Stderr, "  error linking %s: %v\n", item.Name, err)
			continue
		}

		fmt.Printf("  linked: %s → %s\n", item.TargetPath, item.SourcePath)
		applied++
	}

	if applied == 0 {
		fmt.Println("Nothing to do.")
	} else {
		fmt.Printf("Applied %d symlink(s).\n", applied)
	}
}
