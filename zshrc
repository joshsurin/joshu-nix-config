ZINIT_HOME="/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Keybindings
# bindkey -e
# bindkey '^p' history-search-backward
# bindkey '^[[A' history-search-backward
# bindkey '^n' history-search-forward
# bindkey '^[[B' history-search-forward
# bindkey '^[w' kill-region
# bindkey "\e[1;3D" backward-word     # ⌥←
# bindkey "\e[1;3C" forward-word      # ⌥→
# bindkey "^[[1;9D" beginning-of-line # cmd+←
# bindkey "^[[1;9C" end-of-line       # cmd+→

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# granted setup
. "$HOME/.cargo/env"
alias assume=". assume"

export FZF_DEFAULT_OPTS='--multi --no-height --extended --bind ctrl-space:toggle,enter:accept-non-empty'

eval "$(fnm env --use-on-cd)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# kubectl auto complete
eval "source <(kubectl completion zsh)"

# terraform auto complete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Aliases
alias cat='bat --color=always'
alias ls='ls --color'
alias c='clear'
alias k="kubectl"
alias kgp="kubectl get pod"
alias klp="kubectl logs -f"
alias kdp="kubectl delete pod"
alias code="code-insiders"
alias ls="eza --color=always --long --no-filesize --icons=always --group-directories-first --no-time --no-user --no-permissions"
alias lsa="eza --color=always --long -hal --icons=always --group-directories-first"
