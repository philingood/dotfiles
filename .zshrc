export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="kolo"
# ENABLE_CORRECTION="true"
# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 30

plugins=(
  brew
  git 
  z 
  docker 
  tmux
  zsh-autosuggestions
)


# ~~~~ EXPORTS ~~~~~~~~~~~~~~~~~~~~~~~~

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export HOMEBREW_NO_AUTO_UPDATE=1

export ICLOUD_DIR='$HOME/Library/Mobile\ Documents/com~apple~CloudDocs'
export DEV_DIR='$HOME/Developer'
export ONEDRIVE_DIR='$HOME/OneDrive\ -\ wpt.medfordmemorial.org/'
export CLOUDDOWNLOADS_DIR='$HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads'
export NEXTCLOUD_DIR='$HOME/Nextcloud'


export PATH="$HOME/Applications/whisper.cpp/bin:$PATH"
export PATH="$HOME/bin:$PATH"



# SOURCES
source $ZSH/oh-my-zsh.sh
source $HOME/bin/scripts/upd-nvim.sh
source <(kubectl completion zsh)


# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
# eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/hacker/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/hacker/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/hacker/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/hacker/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
