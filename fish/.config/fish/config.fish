if status is-interactive
    # Starship custom prompt
    starship init fish | source

    # Direnv + Zoxide
    command -v direnv &>/dev/null && direnv hook fish | source
    command -v zoxide &>/dev/null && zoxide init fish --cmd cd | source

    # Custom colours
    cat ~/.local/state/caelestia/sequences.txt 2>/dev/null

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end
end

# 别名定义
alias t "tty-clock -c -C 5 -b -t"
alias cls clear
alias CLS clear
alias TUI /home/zy/zy/XM/GO/TUI/TUI
alias tui /home/zy/zy/XM/GO/TUI/TUI
alias bcat /home/zy/zy/XM/GO/Better_cat/cat
# alias myip "ip -br -4 a "
alias csv /home/zy/zy/XM/Python/Mamba2_AE_LP/data/图像/GO_Data/CSV_Data/CSV_Data
alias CSV /home/zy/zy/XM/Python/Mamba2_AE_LP/data/图像/GO_Data/CSV_Data/CSV_Data
alias see /home/zy/zy/XM/GO/See_ALL/SEE
alias SEE /home/zy/zy/XM/GO/See_ALL/SEE
alias zz zellij
alias wifi wavemon
alias WIFI wavemon
alias hx helix
alias sf "source ~/.config/fish/config.fish"
alias gowin 'GOOS=windows GOARCH=amd64 go build -ldflags="-s -w" .'
alias golinux 'go build -ldflags="-s -w" .'
alias gomac 'GOOS=darwin GOARCH=arm64 go build .'
alias cgowin 'CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -ldflags="-s -w" .'
alias cgolinux 'CGO_ENABLED=0 go build -ldflags="-s -w" .'
alias cgomac 'CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build .'
alias mrn "hyprctl monitors"
alias c 'clear && arch'
alias lc 'clear && arch'
alias cl 'clear && arch'
alias l 'eza -la --sort=extension --group-directories-first'
alias ls 'eza -l --sort=extension --group-directories-first'
alias z "zellij a code"
alias qt "cd /usr/share/applications"
alias ts "sudo -E timeshift-launcher"
alias pdf zathura
alias w "curl wttr.in/Beijing"
alias cat lolcat
alias update "sudo pacman -Syu && yay -Syu"
alias gl 'git --no-pager log --oneline --parents --graph'
alias fzf 'fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias sshgo 'ssh root@39.107.193.139'
alias pre 'cp /home/zy/zy/Linux/Apps/Pre-commit/pre-commit ./.git/hooks/'
alias save 'sudo snapper -c home create -d "手动创建快照"'
alias nc 'caelestia shell notifs clear'
alias md glow

# 键盘绑定
bind \ez "hx ."
bind \eg gitui
bind \ex y

# 环境变量 - 合并设置
set -x ZO_DOCTOR 0
set -x EDITOR zed
set -x SUDO_EDITOR "$EDITOR"
set -x MICRO_TRUECOLOR 1
set -x GOOGLE_CLOUD_PROJECT i-academy-464206-d7
set -x PATH "$HOME/.cargo/bin" "/home/zyoung/.opencode/bin" "/home/zyoung/.npm-global/bin" "/home/zy/.local/share/../bin" $PATH

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/zy/.lmstudio/bin
# End of LM Studio CLI section

fzf --fish | source
