# 🚀 NEOVIM KEYMAP CHEATSHEET

## 📁 CORE NAVIGATION
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>f` | n | Smart Find Files | snacks/keys.lua |
| `<leader>b` | n | Buffers | snacks/keys.lua |
| `<leader> ` | n | Live Grep | snacks/keys.lua |
| `<leader>e` | n | File Explorer | snacks/keys.lua |
| `<leader>t` | n | Terminal | snacks/keys.lua |
| `<A-e>` | n,t,i | Float Terminal | keymaps.lua |
| `<S-h>/<S-l>` | n | Prev/Next Buffer | utils.lua |
| `<S-j>/<S-k>` | n | Move Buffer Up/Down | utils.lua |
| `<Tab>/<S-Tab>` | n | Next/Prev Tab | utils.lua |
| `<leader>x` | n | Delete Buffer | snacks/keys.lua |
| `<leader>bd` | n | Close Buffer | keymaps.lua |
| `<Esc>` | n | Clear Search | keymaps.lua |

## 🔍 FIND & SEARCH
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>ff` | n | Find Files | snacks/keys.lua |
| `<leader>fr` | n | Recent Files | snacks/keys.lua |
| `<leader>fc` | n | Find Config Files | snacks/keys.lua |
| `<leader>fg` | n | Find Git Files | snacks/keys.lua |
| `<leader>sw` | n,x | Search Word | snacks/keys.lua |
| `<leader>sl` | n | Search Lines | snacks/keys.lua |
| `<leader>sh` | n | Help Pages | snacks/keys.lua |
| `<leader>sM` | n | All Manuals | snacks/keys.lua |
| `<leader>sk` | n | Keymaps | snacks/keys.lua |
| `<leader>sd` | n | Diagnostics | snacks/keys.lua |
| `<leader>sr` | n | Resume Search | snacks/keys.lua |
| `<leader>sf` | n | Find & Replace | utils.lua |
| `<leader>h` | n | Command History | snacks/keys.lua |

## 🌿 GIT OPERATIONS
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>gg` | n | Lazygit | snacks/keys.lua |
| `<leader>gb` | n | Git Branches | snacks/keys.lua |
| `<leader>gl` | n | Git Log | snacks/keys.lua |
| `<leader>gs` | n | Git Status | snacks/keys.lua |
| `<leader>gd` | n | Git Diff | snacks/keys.lua |
| `<leader>gf` | n | Git Log File | snacks/keys.lua |

## 🔧 LSP & CODE NAVIGATION
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `gd` | n | Go to Definition | lsp.lua |
| `gr` | n | Go to References | lsp.lua |
| `gi` | n | Go to Implementation | lsp.lua |
| `gy` | n | Go to Type Definition | lsp.lua |
| `gD` | n | Go to Declaration | lsp.lua |
| `<leader>rn` | n | Rename Symbol | lsp.lua |
| `<leader>ca` | n | Code Action | lsp.lua |
| `K` | n | Hover Documentation | lsp.lua |
| `gm` | n | Go to Manual | snacks/keys.lua |
| `<leader>ds` | n | Document Symbols | lsp.lua |
| `<leader>ws` | n | Workspace Symbols | lsp.lua |
| `<leader>ls` | n | LSP Document Symbols | snacks/keys.lua |
| `<leader>lw` | n | LSP Workspace Symbols | snacks/keys.lua |
| `]]` | n,t | Next Reference | snacks/keys.lua |
| `[[` | n,t | Prev Reference | snacks/keys.lua |

## ⚡ DIAGNOSTICS & ERRORS
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>j` | n | Next Diagnostic | keymaps.lua |
| `<leader>k` | n | Previous Diagnostic | keymaps.lua |
| `<leader>dd` | n | Show Diagnostic | keymaps.lua |
| `<leader>q` | n | Quickfix List | keymaps.lua |
| `<leader>ud` | n | Toggle Diagnostics | snacks/init.lua |

## 🪟 WINDOW MANAGEMENT
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<C-h>/<C-l>` | n | Focus Left/Right | keymaps.lua |
| `<C-j>/<C-k>` | n | Focus Up/Down | keymaps.lua |
| `<C-A-h>/<C-A-l>` | n | Resize Width | keymaps.lua |
| `<C-A-j>/<C-A-k>` | n | Resize Height | keymaps.lua |
| `<Esc><Esc>` | t | Exit Terminal Mode | keymaps.lua |

## 🚀 GO DEVELOPMENT
*Filetype: go*

### Debug Operations
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>db` | go | Debug Breakpoint | snacks/keys.lua |
| `<leader>dc` | go | Debug Continue | snacks/keys.lua |
| `<leader>di` | go | Debug Step Into | snacks/keys.lua |
| `<leader>do` | go | Debug Step Over | snacks/keys.lua |
| `<leader>dO` | go | Debug Step Out | snacks/keys.lua |
| `<leader>dr` | go | Debug REPL | snacks/keys.lua |
| `<leader>dus` | go | Debug Open Sidebar | snacks/keys.lua |
| `<leader>dgt` | go | Debug Go Test | snacks/keys.lua |
| `<leader>dgl` | go | Debug Last Test | snacks/keys.lua |

### Go Utilities
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>gsj` | go | Add JSON Tags | snacks/keys.lua |
| `<leader>gsy` | go | Add YAML Tags | snacks/keys.lua |
| `<leader>gst` | go | Remove Tags | snacks/keys.lua |
| `<leader>gie` | go | Add if err | snacks/keys.lua |
| `<leader>gtj` | go | Add Test | snacks/keys.lua |
| `<leader>gta` | go | Add All Tests | snacks/keys.lua |
| `<leader>gtf` | go | Add Export Tests | snacks/keys.lua |
| `<leader>gcf` | go | Generate Comment | snacks/keys.lua |
| `<leader>gd` | go | Browse Go Docs | godoc.lua |
| `<leader>gD` | go | Go Doc (word) | godoc.lua |

## 💻 AI & COPILOT

### Copilot (Insert Mode)
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<A-a>` | i | Accept Copilot | utils.lua |
| `<A-w>` | i | Accept Word | utils.lua |
| `<A-j>` | i | Next Suggestion | utils.lua |
| `<A-k>` | i | Prev Suggestion | utils.lua |

### OpenCode AI
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>ot` | n | Toggle OpenCode | opencode.lua |
| `<leader>oa` | n | Ask OpenCode | opencode.lua |
| `<leader>oa` | v | Ask about Selection | opencode.lua |
| `<leader>op` | n,v | Select Prompt | opencode.lua |
| `<leader>on` | n | New Session | opencode.lua |
| `<leader>oy` | n | Copy Last Message | opencode.lua |
| `<S-C-u>` | n | Scroll Messages Up | opencode.lua |
| `<S-C-d>` | n | Scroll Messages Down | opencode.lua |

## 🔧 C/C++ DEVELOPMENT
*Filetype: c,cpp*

| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<F2>` | c,cpp | Format C Code | c_formatter_42.lua |
| `<F3>` | c,cpp | Run Norminette | c_formatter_42.lua |
| `<F4>` | n | Insert 42 Header | header.lua |
| `q` | n | Close Result Window | c_formatter_42.lua |

## 🔄 TOGGLE OPTIONS
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>us` | n | Toggle Spelling | snacks/init.lua |
| `<leader>uw` | n | Toggle Wrap | snacks/init.lua |
| `<leader>uL` | n | Toggle Relative Num | snacks/init.lua |
| `<leader>ul` | n | Toggle Line Numbers | snacks/init.lua |
| `<leader>ub` | n | Toggle Background | snacks/init.lua |
| `<leader>uc` | n | Toggle Conceal | snacks/init.lua |
| `<leader>uT` | n | Toggle TreeSitter | snacks/init.lua |
| `<leader>uh` | n | Toggle Inlay Hints | snacks/init.lua |
| `<leader>ug` | n | Toggle Indent Guides | snacks/init.lua |
| `<leader>uD` | n | Toggle Dim Inactive | snacks/init.lua |

## 🎯 UTILITIES & SPECIAL
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>z` | n | Toggle Zen Mode | snacks/keys.lua |
| `<leader>n` | n | Notification History | snacks/keys.lua |
| `<leader>r` | n | Rename File | snacks/keys.lua |
| `<leader>?` | n | This Cheatsheet | snacks/keys.lua |
| `<leader>K` | n | All Keymaps | snacks/keys.lua |
| `gc` | n | Comment Lines | utils.lua |

## 📊 FZF-LUA KEYMAPS
*Alternative picker interface*

### File Operations
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>ff` | n | Find Files | fzf.lua |
| `<leader>fg` | n | Live Grep | fzf.lua |
| `<leader>fb` | n | Find Buffers | fzf.lua |
| `<leader>fh` | n | Help Tags | fzf.lua |
| `<leader>fr` | n | Recent Files | fzf.lua |
| `<leader>fc` | n | Grep Word | fzf.lua |
| `<leader>fC` | n | Grep WORD | fzf.lua |

### Git Operations
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>gs` | n | Git Status | fzf.lua |
| `<leader>gc` | n | Git Commits | fzf.lua |
| `<leader>gC` | n | Git Buffer Commits | fzf.lua |
| `<leader>gb` | n | Git Branches | fzf.lua |

### LSP Operations
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>lr` | n | LSP References | fzf.lua |
| `<leader>ld` | n | LSP Definitions | fzf.lua |
| `<leader>li` | n | LSP Implementations | fzf.lua |
| `<leader>lt` | n | LSP Type Definitions | fzf.lua |
| `<leader>ls` | n | Document Symbols | fzf.lua |
| `<leader>lS` | n | Workspace Symbols | fzf.lua |
| `<leader>la` | n | Code Actions | fzf.lua |
| `<leader>lD` | n | Workspace Diagnostics | fzf.lua |

### Misc Operations
| Key Combination | Mode | Description | File Location |
|----------------|------|-------------|---------------|
| `<leader>fk` | n | Keymaps | fzf.lua |
| `<leader>f:` | n | Command History | fzf.lua |
| `<leader>f/` | n | Search History | fzf.lua |

---

## 🗂️ File Organization

- **keymaps.lua**: Core Neovim keymaps (diagnostics, windows, terminal)
- **snacks/keys.lua**: Main plugin keymaps (file ops, git, LSP, utilities) 
- **snacks/init.lua**: Toggle option keymaps
- **utils.lua**: BufferLine navigation, Copilot, Spectre
- **lsp.lua**: LSP-specific keymaps (auto-configured on attach)
- **fzf.lua**: Alternative FZF-based picker keymaps
- **godoc.lua**: Go documentation keymaps
- **c_formatter_42.lua**: C formatting and Norminette
- **header.lua**: 42 School header insertion
- **opencode.lua**: AI assistance integration

## 📈 Total Keymap Count: **100+**

Press `<leader>?` in Neovim to see the interactive cheatsheet!