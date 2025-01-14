ZINIT_HOME="$HOME/zinit/zinit.git"

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

# Tmux plugins
TPM_HOME="$HOME/.tmux/plugins/tpm"
# Download tpm, if it's not there yet
if [ ! -d "$TPM_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/tmux-plugins/tpm "$TPM_HOME"
fi

tmux source ~/.tmux.conf

export TERM="xterm-256color"

# Main highlight colors
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
typeset -A ZSH_HIGHLIGHT_STYLES

# Main syntax highlighting
ZSH_HIGHLIGHT_STYLES[default]='fg=#a0a9cb'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f7768e'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#bb9af7'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#7dcfff'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#7dcfff'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#7dcfff'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#7aa2f7'
ZSH_HIGHLIGHT_STYLES[function]='fg=#7aa2f7'
ZSH_HIGHLIGHT_STYLES[command]='fg=#7aa2f7'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#7aa2f7,italic'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#769ff0'
ZSH_HIGHLIGHT_STYLES[path]='fg=#a3aed2,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#f7768e'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#a3aed2'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#f7768e'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#bb9af7'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#bb9af7'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#9ece6a'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#9ece6a'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#9ece6a'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#9ece6a'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#73daca'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#73daca'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#73daca'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#a0a9cb'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#769ff0'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#565f89'

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

# eval "$(fnm env --use-on-cd)"
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
alias ls="eza --color=always --no-filesize --icons=always --group-directories-first --no-time --no-user --no-permissions"
alias lsa="eza --color=always -hal --icons=always --group-directories-first"

# Nix/home-manager
alias rnixwsl="sudo nixos-rebuild switch --flake '/home/joshu/joshu-nix-config/#joshu-wsl' --impure"
alias rnixmac="sudo nixos-rebuild switch --flake '/Users/joshuasurin/s/joshu-nix-config/#joshu-mac' --impure"
alias hmswsl="home-manager switch --flake '/home/joshu/joshu-nix-config/#joshu-wsl' --impure --extra-experimental-features nix-command --extra-experimental-features flakes"
alias hmsmac="home-manager switch --flake '/Users/joshuasurin/s/joshu-nix-config/#joshu-mac' --impure"
alias nvimz="nvim '/home/joshu/joshu-nix-config/zshrc'"
alias tmuxstake="tmuxp load ~/s/randtmp/staketmux.yml"

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

test -r ~/.config/dircolors/nord.dircolors && eval "$(dircolors ~/.config/dircolors/nord.dircolors)"
