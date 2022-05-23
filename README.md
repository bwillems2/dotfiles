# Dotfiles

My dotfiles

These are managed using [dot](https://github.com/ssh0/dot)

## Setup Instructions

Install dot
```
git clone https://github.com/ssh0/dot $HOME/.zsh/dot
export DOT_DIR="$HOME/.dotfiles"
source $HOME/.zsh/dot/dot.sh
```

Install oh-my-zsh
```
sh -c "$(curl -fssl https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install powerlevel10k

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Using dot

Check what links are in place

`dot check`

Set links

`dot set`