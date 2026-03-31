# AstroNvim config

Based on AstroNvim v6 [template](https://github.com/AstroNvim/template)

## 🛠️ Installation

### Install as main config

```shell
# Backup your current config
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# clone config to main nvim config
git clone https://github.com/tumrin/https://github.com/tumrin/astronvim-config ~/.config/nvim 

# start neovim
nvim 
```

### Alternatively install as separate config

```shell
# clone config to separate nvim config
git clone https://github.com/tumrin/https://github.com/tumrin/astronvim-config ~/.config/nvim-tumrin 

# start neovim with specified config
NVIM_APPNAME="nvim-tumrin" nvim 
```

