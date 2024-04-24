# kickstart.nvim

### Introduction

this is an custom confirmation of neovim based on [kickstarter](https://github.com/nvim-lua/kickstart.nvim) in which i have

-   added some plugins
-   changed many keybinds and added new ones
-   added better ui elements
-   added some opts

### Installation

> **NOTE** > [Backup](#FAQ) your previous configuration (if any exists)

Requirements:

-   Make sure to review the readmes of the plugins if you are experiencing errors. In particular:
    -   [ripgrep](https://github.com/BurntSushi/ripgrep#installation) is required for multiple [telescope](https://github.com/nvim-telescope/telescope.nvim#suggested-dependencies) pickers.
-   See [Windows Installation](#Windows-Installation) if you have trouble with `telescope-fzf-native`

Neovim's configurations are located under the following paths, depending on your OS:

Clone kickstart.nvim:

-   on Linux and Mac

```sh
git clonehttps://github.com/samarth-nagar/nvim "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

If you're using cmd.exe:

```sh
git clone https://github.com/nvim-lua/kickstart.nvim.git %userprofile%\AppData\Local\nvim\
```

If you're using powershell.exe

```sh
git clone https://github.com/nvim-lua/kickstart.nvim.git $env:USERPROFILE\AppData\Local\nvim\
```

### Post Installation

Start Neovim

```sh
nvim
```

### Configuration And Extension

-   Inside of your copy, feel free to modify any file you like! It's your copy!
-   Feel free to change any of the default options in `init.lua` to better suit your needs.
-   For adding plugins, there are 3 primary options:
    -   Add new configuration in `lua/custom/plugins/*` files, which will be auto sourced using `lazy.nvim` (uncomment the line importing the `custom/plugins` directory in the `init.lua` file to enable this)
    -   Modify `init.lua` with additional plugins.
    -   Include the `lua/kickstart/plugins/*` files in your configuration.

### Windows Installation

Installation may require installing build tools, and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

-   Install CMake, and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```
