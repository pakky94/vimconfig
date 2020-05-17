set session_name "lobby"
set tmux_bin "/usr/bin/tmux"

alias tmux="tmux -2"
alias ll="exa --long --header --git --group-directories-first"
alias gst="nvim +Gstatus +only"

abbr -a t start_tmux_lobby
abbr -a tn start_tmux_lobby_new_window
abbr -a e nvim
abbr -a s "bash -c"

fish_vi_key_bindings
fish_ssh_agent

function fish_greeting
    if [ $TERM = 'alacritty' ]
        start_tmux_lobby
    end
    echo
    echo -e (uname -ro | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e (uptime -p | sed 's/^up //' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e (uname -n | awk '{print " \\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e " \\e[1mDisk usage:\\e[0m"
    echo
        echo -ne (\
        df -l -h 2> /dev/null | grep -E 'dev/(xvda|sd|mapper)' | \
        awk '{printf "\\\\t%20s\\\\t%4s / %4s  %s\\\\n\n", $6, $3, $2, $5}' | \
        sed -e 's/^\(.*\([8][5-9]\|[9][0-9]\)%.*\)$/\\\\e[0;31m\1\\\\e[0m/' -e 's/^\(.*\([7][5-9]\|[8][0-4]\)%.*\)$/\\\\e[0;33m\1\\\\e[0m/' | \
        paste -sd ''\
    )
    echo
end

function start_tmux_lobby_new_window
    if eval "$tmux_bin has-session -t $session_name 2> /dev/null"
        $tmux_bin new-session -t $session_name \; set destroy-unattached on \; new-window
    else
        $tmux_bin new-session -s $session_name
    end
end

function start_tmux_lobby
    if eval "$tmux_bin has-session -t $session_name 2> /dev/null"
        $tmux_bin new-session -t $session_name \; set destroy-unattached on
    else
        $tmux_bin new-session -s $session_name
    end
end

function checkupdates
    yay -Syu
    flatpak update
end

function systemupdate
    ~/dotfiles/bin/systemupdate.sh
end
