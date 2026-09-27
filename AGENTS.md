# AGENTS.md

This is a personal Neovim configuration based on kickstart.nvim. Not a software project - directly edit Lua files to modify.

## Key commands

- `nvim` - Start Neovim (plugins auto-install on first run via lazy.nvim)
- `:Lazy` - Plugin manager UI
- `:Lazy update` - Update plugins

## Important non-obvious keymaps

- `<Space>` - Leader key
- `<localleader> =` - Close other windows (`<C-w>o`)
- `<Tab>` / `<S-Tab>` - Next/prev buffer
- `<leader>tw` - Toggle spellcheck
- `<leader>td` - Toggle LSP diagnostics
- `<leader>tc` - Toggle treesitter context
- `<leader>xx` - Trouble diagnostics UI
- `L` / `H` - Go to line end/start (like Airline-friendly)
- `j` / `k` - Handle wrapped lines with `gj`/`gk`
- `vv` - Visual line mode

## Configuration quirks

- Shell: **fish** — resolved from `PATH` via `vim.fn.exepath("fish")`, falls back to `/bin/sh`
- Tabs: 4 spaces, expandtab enabled
- Line width: 80 chars (`.stylua.toml`)
- Clipboard: delayed init via `schedule()` - needed for clipboard to work
- `vim.g.have_nerd_font = true` - Nerd Font enabled
- `lazy.setup()` takes `{ spec = { ...plugins } }` — anything placed *outside* `spec` is a
  root option, anything inside is a plugin spec. Putting a root option inside `spec`
  silently does nothing.
- `nvim-treesitter` is on the **rewrite (main) branch**: no `ensure_installed` /
  `auto_install`. Use `:TSInstall <lang>` / `:TSUpdate`, which need `tree-sitter-cli`.
- `render-markdown.nvim` is v8: `indent.chars` → `indent.icon`, and the `list` table is gone
  (use `bullet`).

## External binaries

- Required: `tree-sitter-cli`, `fd`, `ripgrep`
- Optional: `wget`, `ghostscript` (PDF images), `tectonic`/`pdflatex` (LaTeX math),
  `@mermaid-js/mermaid-cli` (Mermaid diagrams)

## File structure

- `init.lua` - Entry point, loads modules in order
- `lua/options.lua` - Vim settings
- `lua/keymaps.lua` - Global keymaps
- `lua/keybinds.lua` - Additional keybindings
- `lua/macros.lua` - Macros
- `lua/lazy-plugins.lua` - Plugin spec + imports
- `lua/custom/plugins/` - User plugins
- `lua/kickstart/plugins/` - Base kickstart plugins

## Formatting

Run StyLua before committing:
```sh
stylua lua/
```

Config: `.stylua.toml` (80 column width, single quotes preferred)