#brew
export PATH="/opt/homebrew/bin:$PATH"

#java
export JAVA_HOME=$(brew --prefix openjdk)/libexec/openjdk.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

#alias
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias intersect="cd '/Users/jackson/Library/Mobile Documents/iCloud~md~obsidian/Documents/intersect'"
alias bu="brew update && brew upgrade && brew cleanup && brew autoremove"
alias ls='eza --icons --group-directories-first'

#starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

#zoxide
eval "$(zoxide init zsh)"

#zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
