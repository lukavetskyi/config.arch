HISTFILE=~/.cache/zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

alias e='nvim'

export MANPAGER='nvim +Man!'
export VCPKG_ROOT=~/.vcpkg
export PATH=$VCPKG_ROOT:$PATH
export EDITOR=vim


autoload -U colors compinit
zstyle ':completion:*' menu select
zstyle ':completion:*'  list-colors '=*=96'
zstyle ':completion:*' rehash true
colors
compinit

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=30'
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

source ~/.config/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/prompt.zsh


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
