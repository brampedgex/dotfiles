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

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
unsetopt autocd

# Keybindings
bindkey -e
# Bind ^L to clear so the prompt can be positioned at the top
bindkey -s '^L' 'clear^M'

autoload -Uz compinit && compinit

# oh-my-posh prompt (installed via paru)
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"

# Set preferred editor
export EDITOR='nvim'

# Aliases
alias ls='ls --color'
alias vim='nvim'

