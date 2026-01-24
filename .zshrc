# brew
export PATH="/opt/homebrew/bin:$PATH"
alias bu="brew update && brew upgrade && brew cleanup && brew autoremove"

# java
export JAVA_HOME=$(brew --prefix openjdk)/libexec/openjdk.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# directories
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias intersect="cd '/Users/jackson/Library/Mobile Documents/iCloud~md~obsidian/Documents/intersect'"
alias ttu="cd '/Users/jackson/Library/Mobile Documents/iCloud~md~obsidian/Documents/intersect/school/2/spring2026'"

# git
alias g="git"
alias ga="git add ."
alias gs="git status -s"
alias gc="git commit -m"

# lazygit
alias lg="lazygit"

# eza 
alias ls='eza --icons --group-directories-first'
alias ll="eza --long --no-filesize --no-user --icons --all --group-directories-first"
alias tree="eza --tree --level=2 --all"

# fzf
alias fn='nvim $(fd --type f --hidden --exclude .git | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")'
alias fp='cd $(fd --type d --hidden --exclude .git | fzf) && nvim .'

# make life easier
alias c="clear"

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# zoxide
eval "$(zoxide init zsh)"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--color=bg+:#283457,bg:-1,gutter:-1,spinner:#ff9e64,hl:#7ad5ff,fg:#c0caf5,header:#9ece6a,info:#0db9d7,pointer:#7aa2f7,marker:#9ece6a,fg+:#c0caf5,prompt:#7aa2f7,hl+:#7ad5ff --prompt="❯ " --pointer="❯" --layout=reverse --border --height=40%'
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
source <(fzf --zsh)

# zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
