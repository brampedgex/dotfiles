# Hack fix for alacritty: https://github.com/alacritty/alacritty/issues/1616
unsetopt PROMPT_SP

# Download and source zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Add zinit plugins (TBD)
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Other options
unsetopt autocd

# Keybindings
bindkey -e
# Bind ^L to clear so the prompt can be positioned at the top
bindkey -s '^L' 'clear^M'
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

autoload -Uz compinit && compinit

# oh-my-posh prompt (installed via paru)
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"

# Set preferred editor
export EDITOR='nvim'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias vi='nvim'
alias sudo='sudo '
