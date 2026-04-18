# ivim

An easy and customizable Vim/Neovim setup with a modern Neovim path and legacy Vim paths in one repository.

```
    _       _
   (_)   __(_)___ ___
  / / | / / / __ `__ \
 / /| |/ / / / / / / /
/_/ |___/_/_/ /_/ /_/
```

## Current Status

ivim now provides three tracks:

1. `nvim/init.lua` (modern Neovim, recommended)
2. `vimrc_mini` (legacy Vim/Neovim script config)
3. `vimrc` (legacy full config, not actively maintained)

If you like this project, you can [buy me a coffee](https://www.paypal.me/kepbod).

## Choose a Track

| Track | File | Best for | Status |
| --- | --- | --- | --- |
| Modern Neovim | [nvim/init.lua](nvim/init.lua) | Neovim users who want modern plugins and Lua config | Recommended |
| Mini legacy | [vimrc_mini](vimrc_mini) | Vim 8+ and users who prefer Vimscript setup | Stable |
| Full legacy | [vimrc](vimrc) | Historical ivim setup | Not maintained |

## Highlights (Modern Neovim)

- Nord-based UI
- Single-file config (`nvim/init.lua`)
- `lazy.nvim` plugin management
- `telescope.nvim` + `neo-tree.nvim` navigation
- `nvim-lspconfig` + `mason.nvim` + `nvim-cmp` for LSP/completion
- `treesitter`, formatting (`conform.nvim`), linting (`nvim-lint`)

## Screenshots

Legacy screenshots are kept for reference:

- ivim: ![ivim](https://raw.githubusercontent.com/kepbod/ivim/master/snapshot/ivim.jpeg)
- ivim_mini: ![ivim_mini](https://raw.githubusercontent.com/kepbod/ivim/master/snapshot/ivim_mini.jpeg)

## Requirements

### For modern Neovim track (`-N`)

- Neovim 0.10+
- Git
- `curl` or `wget`
- Node.js + npm (for `pyright` and other npm-based Mason packages)
- Recommended external tools: `shellcheck`, `ruff`, `markdownlint`, `eslint_d`

### For legacy tracks (`-i`, `-m`, `-u`)

- Vim 7.3+ (`-i`) / Vim 8.0+ (`-m`) / Neovim (`-u`)
- Git
- Optional: `ctags`

## Installation

### Modern Neovim (recommended)

```bash
bash <(curl -L https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh) -N
# or
bash <(wget --no-check-certificate https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh -O -) -N
```

### Legacy full ivim

```bash
bash <(curl -L https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh) -i
```

### Legacy mini for Vim

```bash
bash <(curl -L https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh) -m
```

### Legacy mini for Neovim (Vimscript)

```bash
bash <(curl -L https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh) -u
```

## Setup Script Options

`setup.sh` supports:

- `-i`: install legacy full ivim
- `-m`: install legacy mini for Vim
- `-u`: install legacy mini for Neovim
- `-N`: install modern Neovim single-file config
- `-n`: update ivim and installed plugins
- `-d` / `--dry-run`: print actions without changing files
- `-y` / `--yes`: auto-confirm prompts

Examples:

```bash
# Preview modern Neovim install
bash setup.sh --dry-run -N

# Install modern Neovim config non-interactively
bash setup.sh --yes -N

# Update non-interactively
bash $HOME/.ivim/setup.sh --yes -n
```

## Updating

```bash
bash $HOME/.ivim/setup.sh -n
```

## Configuration Notes

- Modern Neovim config lives in [nvim/init.lua](nvim/init.lua).
- Legacy mini config is [vimrc_mini](vimrc_mini).
- Legacy full config is [vimrc](vimrc).
- The modern Neovim track enables LSP by default for Lua (`lua_ls`), Python (`pyright`), and Markdown (`marksman`) through `mason.nvim`.
- Leader key is `Space`.
- Default LSP keys in the modern track include `gd`/`gr`/`gi`/`gD`, `K`, `<leader>ls`, `<leader>rn`, `<leader>ca`, and `<leader>cf`.
- Default diagnostics keys include `[d`/`]d`, `<leader>le`, `<leader>ld`, `<leader>lj`, and `<leader>lk`.

### Keymap Quick Reference (Modern Neovim)

- `Space` then wait: open which-key hints
- `Space ?`: open full keymap hints
- `Space ff`: find files
- `Space fg`: live grep
- `Space fb`: buffers
- `Space fr`: recent files
- `Space f`: toggle file tree
- `Space t`: symbols outline
- `Space wh/wj/wk/wl`: move between windows
- `Space wv` / `Space ws`: split vertical / horizontal
- `Space wq`: close current window
- `Space le` / `Space ld`: line diagnostics / diagnostics list
- `Space rn`: rename symbol
- `Space ca`: code action
- `Space cf`: format buffer

For historical customization docs, see the wiki:

- [Colorscheme](https://github.com/kepbod/ivim/wiki/Colorscheme)
- [Customization](https://github.com/kepbod/ivim/wiki/Customization)
- [Tips for ivim](https://github.com/kepbod/ivim/wiki/Tips-for-ivim)

## Contributing

Contributions are welcome. See [issue #31](https://github.com/kepbod/ivim/issues/31) for context.

## License

MIT. See [LICENSE.txt](LICENSE.txt).
