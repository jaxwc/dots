# Homebrew
fish_add_path /opt/homebrew/bin

# Java
set -gx JAVA_HOME (brew --prefix openjdk)/libexec/openjdk.jdk/Contents/Home
fish_add_path $JAVA_HOME/bin

# Starship config path
set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"

# fzf defaults
set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_DEFAULT_OPTS '--color=bg+:#283457,bg:-1,gutter:-1,spinner:#ff9e64,hl:#7ad5ff,fg:#c0caf5,header:#9ece6a,info:#0db9d7,pointer:#7aa2f7,marker:#9ece6a,fg+:#c0caf5,prompt:#7aa2f7,hl+:#7ad5ff --prompt="❯ " --pointer="❯" --layout=reverse --border --height=40%'
set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"

if status is-interactive
    fish_config theme choose flexoki-dark

    alias bu="brew update && brew upgrade && brew cleanup && brew autoremove"
    alias icloud='cd "$HOME/Library/Mobile Documents/com~apple~CloudDocs"'
    alias g="git"
    alias ga="git add ."
    alias gs="git status -s"
    alias gc="git commit -m"
    alias lg="lazygit"
    alias ls='eza --icons --group-directories-first'
    alias ll="eza --long --no-filesize --no-user --icons --all --group-directories-first"
    alias tree="eza --tree --level=2 --all"
    alias c="clear"
    alias ta="tmux attach"

    function fn
        nvim (fd --type f --hidden --exclude .git | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")
    end

    function fp
        set dir (fd --type d --hidden --exclude .git | fzf)
        if test -n "$dir"
            cd "$dir"
            nvim .
        end
    end

    starship init fish | source
    zoxide init fish | source
end
