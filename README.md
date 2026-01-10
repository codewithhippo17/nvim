# 💤 LazyVim Configuration - Keybindings Cheatsheet

A comprehensive guide to all keybindings and functionality in this LazyVim-based Neovim configuration.

## 🎯 Table of Contents

- [Custom Keymaps](#custom-keymaps)
- [Navigation](#navigation)
- [Buffers & Tabs](#buffers--tabs)
- [Windows](#windows)
- [File Operations](#file-operations)
- [Git Operations](#git-operations)
- [LSP & Code Actions](#lsp--code-actions)
- [Search & Replace](#search--replace)
- [Diagnostics](#diagnostics)
- [Terminal](#terminal)
- [Toggles](#toggles)
- [Plugin-Specific Keymaps](#plugin-specific-keymaps)
- [OpenCode AI Integration](#opencode-ai-integration)

---

## 🔑 Custom Keymaps

### Insert Mode Escapes
| Key | Action | Description |
|-----|--------|-------------|
| `jj` | Escape to Normal Mode | Quick escape alternative |
| `jk` | Escape to Normal Mode | Quick escape alternative |

---

## 🧭 Navigation

### Basic Movement
| Key | Action | Description |
|-----|--------|-------------|
| `j` / `<Down>` | Smart Down | Visual line down (respects word wrap) |
| `k` / `<Up>` | Smart Up | Visual line up (respects word wrap) |
| `n` | Next Search | Next search result (improved behavior) |
| `N` | Previous Search | Previous search result (improved behavior) |

### Window Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<C-h>` | Go to Left Window | Navigate to left split |
| `<C-j>` | Go to Lower Window | Navigate to bottom split |
| `<C-k>` | Go to Upper Window | Navigate to top split |
| `<C-l>` | Go to Right Window | Navigate to right split |

### Line Movement
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<A-j>` | Normal/Insert/Visual | Move Line Down | Move current line/selection down |
| `<A-k>` | Normal/Insert/Visual | Move Line Up | Move current line/selection up |

---

## 📄 Buffers & Tabs

### Buffer Operations
| Key | Action | Description |
|-----|--------|-------------|
| `<S-h>` / `[b` | Previous Buffer | Switch to previous buffer |
| `<S-l>` / `]b` | Next Buffer | Switch to next buffer |
| `<leader>bb` / `<leader>\`` | Switch to Other Buffer | Toggle between current and last buffer |
| `<leader>bd` | Delete Buffer | Close current buffer (smart close) |
| `<leader>bo` | Delete Other Buffers | Close all buffers except current |
| `<leader>bD` | Delete Buffer and Window | Force close buffer and its window |

### Tab Management
| Key | Action | Description |
|-----|--------|-------------|
| `<leader><tab><tab>` | New Tab | Create new tab |
| `<leader><tab>]` | Next Tab | Switch to next tab |
| `<leader><tab>[` | Previous Tab | Switch to previous tab |
| `<leader><tab>f` | First Tab | Go to first tab |
| `<leader><tab>l` | Last Tab | Go to last tab |
| `<leader><tab>d` | Close Tab | Close current tab |
| `<leader><tab>o` | Close Other Tabs | Close all tabs except current |

---

## 🪟 Windows

### Window Management
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>-` | Split Window Below | Horizontal split |
| `<leader>\|` | Split Window Right | Vertical split |
| `<leader>wd` | Delete Window | Close current window |
| `<leader>wm` / `<leader>uZ` | Maximize Window | Toggle window zoom |

### Window Resizing
| Key | Action | Description |
|-----|--------|-------------|
| `<C-Up>` | Increase Height | Make window taller |
| `<C-Down>` | Decrease Height | Make window shorter |
| `<C-Left>` | Decrease Width | Make window narrower |
| `<C-Right>` | Increase Width | Make window wider |

---

## 📁 File Operations

### File Management
| Key | Action | Description |
|-----|--------|-------------|
| `<C-s>` | Save File | Save current file (works in all modes) |
| `<leader>fn` | New File | Create new file in current buffer |
| `<leader>fp` | Find Plugin Files | Browse LazyVim plugin files |

---

## 🌿 Git Operations

### Basic Git
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>gg` | Lazygit (Root Dir) | Open Lazygit in git root |
| `<leader>gG` | Lazygit (cwd) | Open Lazygit in current directory |

### Git Browse & History
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>gB` | Git Browse (open) | Open current file/selection in browser |
| `<leader>gY` | Git Browse (copy) | Copy GitHub URL to clipboard |
| `<leader>gl` | Git Log | Show git log for repo |
| `<leader>gL` | Git Log (cwd) | Show git log for current directory |
| `<leader>gf` | Git Current File History | Show history for current file |
| `<leader>gb` | Git Blame Line | Show blame information for current line |

---

## 🔧 LSP & Code Actions

### Code Formatting & Actions
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>cf` | Format Code | Format current file/selection |
| `<leader>co` | Organize Imports | Organize TypeScript imports |
| `<leader>cR` | Rename File | Rename current TypeScript file |

### Documentation & Help
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>K` | Keywordprg | Show documentation for word under cursor |

---

## 🔍 Search & Replace

### Search Operations
| Key | Action | Description |
|-----|--------|-------------|
| `<Esc>` | Clear Search | Clear search highlight and stop snippets |
| `<leader>ur` | Redraw / Clear hlsearch | Clear search, update diff, redraw |

### Text Editing
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<` | Visual | Decrease Indent | Indent left and maintain selection |
| `>` | Visual | Increase Indent | Indent right and maintain selection |
| `,` / `.` / `;` | Insert | Add Undo Break-points | Create undo points for better editing |

---

## 🩺 Diagnostics

### Diagnostic Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>cd` | Line Diagnostics | Show diagnostics for current line |
| `]d` | Next Diagnostic | Jump to next diagnostic |
| `[d` | Previous Diagnostic | Jump to previous diagnostic |
| `]e` | Next Error | Jump to next error |
| `[e` | Previous Error | Jump to previous error |
| `]w` | Next Warning | Jump to next warning |
| `[w` | Previous Warning | Jump to previous warning |

### Lists
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>xl` | Location List | Toggle location list |
| `<leader>xq` | Quickfix List | Toggle quickfix list |
| `]q` | Next Quickfix | Jump to next quickfix item |
| `[q` | Previous Quickfix | Jump to previous quickfix item |

---

## 💻 Terminal

### Terminal Operations
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ft` | Terminal (Root Dir) | Open terminal in project root |
| `<leader>fT` | Terminal (cwd) | Open terminal in current directory |
| `<C-/>` / `<C-_>` | Toggle Terminal | Open/close terminal (works in terminal too) |

---

## ⚙️ Toggles

### UI Toggles
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>uf` | Toggle Format on Save | Enable/disable auto-formatting |
| `<leader>uF` | Toggle Format (Global) | Global format toggle |
| `<leader>us` | Toggle Spelling | Enable/disable spell check |
| `<leader>uw` | Toggle Wrap | Enable/disable line wrapping |
| `<leader>uL` | Toggle Relative Numbers | Toggle relative line numbers |
| `<leader>ul` | Toggle Line Numbers | Toggle line numbers |
| `<leader>ud` | Toggle Diagnostics | Enable/disable diagnostics |
| `<leader>uc` | Toggle Conceal Level | Toggle concealment |
| `<leader>uA` | Toggle Tabline | Show/hide tabline |
| `<leader>uT` | Toggle Treesitter | Enable/disable syntax highlighting |
| `<leader>ub` | Toggle Dark Background | Switch between dark/light theme |
| `<leader>uh` | Toggle Inlay Hints | Show/hide LSP inlay hints |

### Advanced Toggles
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>uD` | Toggle Dim | Dim unfocused windows |
| `<leader>ua` | Toggle Animate | Enable/disable animations |
| `<leader>ug` | Toggle Indent Guides | Show/hide indentation guides |
| `<leader>uS` | Toggle Scroll | Enable/disable smooth scrolling |
| `<leader>uz` | Toggle Zen Mode | Enter/exit zen mode |

### Debug Toggles
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>dpp` | Toggle Profiler | Enable/disable performance profiler |
| `<leader>dph` | Toggle Profiler Highlights | Show profiler highlights |

---

## 🔌 Plugin-Specific Keymaps

### Lazy Plugin Manager
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>l` | Open Lazy | Launch Lazy plugin manager |

### Comments
| Key | Action | Description |
|-----|--------|-------------|
| `gco` | Add Comment Below | Add comment line below current |
| `gcO` | Add Comment Above | Add comment line above current |

### Copilot (AI Code Completion)
| Key | Action | Description |
|-----|--------|-------------|
| `<M-]>` | Next Suggestion | Cycle to next AI suggestion |
| `<M-[>` | Previous Suggestion | Cycle to previous AI suggestion |

### Mini.surround
| Key | Action | Description |
|-----|--------|-------------|
| `sa` | Add Surround | Add surrounding characters |
| `sd` | Delete Surround | Remove surrounding characters |
| `gsr` | Replace Surround | Replace surrounding characters |
| `gsf` | Find Surround | Find surrounding characters |
| `gsF` | Find Surround Left | Find surrounding characters (left) |
| `gsh` | Highlight Surround | Highlight surrounding characters |
| `gsn` | Update N Lines | Update surround for N lines |

### LazyVim Specific
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>L` | LazyVim Changelog | View LazyVim changelog |
| `<leader>ui` | Inspect Position | Show syntax highlighting groups |
| `<leader>uI` | Inspect Tree | Show Treesitter syntax tree |

### System
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>qq` | Quit All | Exit Neovim |
| `<localleader>r` | Run Lua | Execute Lua code (in .lua files) |

---

## 🤖 OpenCode AI Integration

### Core Commands
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ot` | Normal | Toggle Embedded | Toggle OpenCode embedded view |
| `<leader>oa` | Normal/Visual | Ask About This | Ask AI about cursor position/selection |
| `<leader>o+` | Normal/Visual | Add to Prompt | Add buffer/selection to AI prompt |
| `<leader>oe` | Normal | Explain Code | Ask AI to explain code at cursor |
| `<leader>on` | Normal | New Session | Start new AI conversation |
| `<leader>os` | Normal/Visual | Select Prompt | Select AI prompt template |

### Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<S-C-u>` | Messages Half Page Up | Scroll up in AI messages |
| `<S-C-d>` | Messages Half Page Down | Scroll down in AI messages |

---

## 🎛️ Configuration Files Structure

```
~/.config/nvim/
├── init.lua                    # Main configuration entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua       # Auto commands
│   │   ├── keymaps.lua        # Custom keymaps (jj, jk escapes)
│   │   ├── lazy.lua           # Lazy.nvim setup
│   │   └── options.lua        # Neovim options
│   └── plugins/
│       ├── conform.lua        # Code formatting
│       ├── copilot.lua        # GitHub Copilot
│       ├── go.lua            # Go language support
│       ├── opencode.lua      # OpenCode AI integration
│       ├── surround.lua      # Text surrounding
│       └── windsurf.lua      # Windsurf integration
├── lazy-lock.json            # Plugin version lock file
└── README.md                 # This file
```

---

## 🎨 Themes & UI

- **Default Theme**: Tokyonight
- **Alternative**: Catppuccin
- **Status Line**: Lualine
- **File Explorer**: Neo-tree
- **Notifications**: Noice.nvim

---

## 🛠️ Key Features

### Installed Plugins
- **LazyVim**: Modern Neovim configuration framework
- **LSP Support**: Full language server protocol support
- **Treesitter**: Advanced syntax highlighting
- **Telescope/FZF**: Fuzzy finding
- **Git Integration**: Gitsigns, Lazygit
- **AI Integration**: Copilot + OpenCode
- **Code Formatting**: Conform.nvim
- **Debugging**: nvim-dap
- **Session Management**: Persistence.nvim

### Language Support
- Go (with gopls)
- TypeScript/JavaScript
- Lua
- Python
- JSON/YAML
- Markdown
- And many more via Mason.nvim

---

## 🆘 Getting Help

- Press `<leader>` and wait to see available keybindings via which-key
- Use `:checkhealth` to diagnose configuration issues
- Visit [LazyVim Documentation](https://lazyvim.github.io/) for more details
- Open an issue in the LazyVim repository for bugs

---

## 💡 Tips

1. **Leader Key**: The `<leader>` key is typically `<Space>` in LazyVim
2. **Which Key**: Wait after pressing `<leader>` to see available commands
3. **Buffer vs Tab**: LazyVim focuses on buffers over tabs for file management
4. **Terminal Integration**: Use `<C-/>` for quick terminal access
5. **AI Features**: Leverage both Copilot and OpenCode for enhanced productivity

---

*This configuration is based on [LazyVim](https://github.com/LazyVim/LazyVim) with custom modifications and AI integrations.*