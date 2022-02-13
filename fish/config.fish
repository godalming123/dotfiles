set ttyVar (tty)

if test $ttyVar = "/dev/tty1" # if we are running in tty
    dbus-run-session wayfire
end

if status is-interactive
    # ===================
    # === Add aliases ===
    # ===================

    # ls aliases
    alias ls='ls --color=auto'
    alias ll='ls -lav --ignore=..' # show a long listing of all files/folders except ".."
    alias l='ls -lav -ignore=.?*'  # show a long listing but no hidden files except "."

    # other aliases
    alias screens='kanshi'
    alias config='cd ~/Documents/coding\ repos/dotfiles/; micro fish/config.fish sys-info/ufetch-endevour.sh wayfire/wayfire.ini wayfire/wf-shell.ini alacritty/alacritty.yml wofi/styles.css kanshi/config'
    alias pacman='sudo pacman'
    alias wayfire="dbus-run-session wayfire"
end

function get_branch
    # /dev/null prevents nonsensical errors when you are on directories not tracked by git
    if test (git status --untracked-files=no --porcelian 2> /dev/null | wc -l) -eq 0
        set indicator "no changes"
    else
        set indicator "changes"
    end

    set branch_name (git rev-parse --abbrev-ref HEAD 2> /dev/null)

    if test "$branch_name" != ""
        echo -n " [$indicator] $branch_name "
    else
        echo -n "/ "
    end
end

function fish_prompt
    if test $status -eq 0
        set success true
    else
        set success false
    end

    tput bold #bold colors

    echo -n (pwd)

    get_branch
end

function fish_greeting
    clear
    /bin/ufetch-endevour.sh
    tput sgr0 # reset the font weght + color
    echo "" # creat a new line
end
