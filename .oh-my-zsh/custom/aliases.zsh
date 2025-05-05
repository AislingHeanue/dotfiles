alias please='sudo $(history -p !!)'
alias aliases='vi ~/.local/share/chezmoi/.oh-my-zsh/custom/aliases.zsh && chezmoi apply && reload'
alias reload='. ~/.zshrc'
alias zeload='reload'
alias gateway="ip route show 0.0.0.0/0 dev wlp0s20f3 | cut -d\  -f3"
alias la='ls -la'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias hacknet='TERM=xterm prime-run /mnt/d/Games/Linux/steamapps/common/Hacknet/Hacknet'
alias cube="nohup ~/.jdks/corretto-1.8.0_362/bin/java -Dprism.forceGPU=true -jar ~/Documents/Coding/github/Projects/Rubiks\ Cube/Rubiks\ Cube.jar > /dev/null 2>&1 &"
# alias jelly="sudo systemctl restart jellyfin; sudo systemctl start tailscaled;sudo tailscale up;sudo tailscale funnel --bg 8096"
alias download="yt-dlp --config-location ./ytconf https://www.youtube.com/playlist?list=PLH2ZMngV5dj57mSZfGk-Iz4BY93tKIk61"
alias cat="bat --theme \"Visual Studio Dark+\""
alias show="bat --style plain --theme \"Visual Studio Dark+\""
alias ls="exa --icons --sort name"
alias tm="~/scripts/tmux.sh $@"
