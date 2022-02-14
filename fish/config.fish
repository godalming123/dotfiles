# ==================
# === HANDLE TTY ===
# ==================

set ttyVar (tty)

if test $ttyVar = "/dev/tty1" # if we are running in tty
    dbus-run-session wayfire # run wayfire
end

# =====================
# === FONT SETTINGS ===
# =====================

# === STYLES ===
set reset (tput sgr0)
set bold (tput bold)

# === FONT COLORS ===
set black (tput setaf 0)
set red (tput setaf 1)
set green (tput setaf 2)
set yellow (tput setaf 3)
set blue (tput setaf 4)
set magenta (tput setaf 5)
set cyan (tput setaf 6)
set white (tput setaf 7)

# ===================
# === Add aliases ===
# ===================

if status is-interactive
    # === ls aliases ===
    alias ls='ls --color=auto'
    alias ll='ls -lav --ignore=..' # show a long listing of all files/folders except ".."
    alias l='ls -lav -ignore=.?*'  # show a long listing but no hidden files except "."

    # === other aliases ===
    alias screens='kanshi'
    alias config='cd ~/Documents/coding\ repos/dotfiles/; micro fish/config.fish sys-info/ufetch-endevour.sh wayfire/wayfire.ini wayfire/wf-shell.ini alacritty/alacritty.yml wofi/styles.css kanshi/config'
    alias pacman='sudo pacman'
    alias wayfire="dbus-run-session wayfire"
end

# =====================
# === FISH GREETING ===
# =====================

function fish_greeting
    clear
    /bin/ufetch-endevour.sh
    tput sgr0 # reset the font weght + color
end

# ============================
# === PROMPT CONFIGURATION ===
# ============================

# === git branches ===
function get_branch
    # /dev/null prevents nonsensical errors when you are on directories not tracked by git
    if test (git status --untracked-files=no --porcelian 2> /dev/null | wc -l) -eq 0
        set indicator "no changes"
    else
        set indicator "changes"
    end

    set branch_name (git rev-parse --abbrev-ref HEAD 2> /dev/null)

    if test "$branch_name" != ""
        echo -n "$reset on$cyan $branch_name$reset with$cyan $indicator" # if we are on a git folder
    end
end

# === prompt working directory ===
function workingDir
    echo -n "in $blue"
    echo -n (pwd)
end

# === prompt indicator ===
function indicator
    if test "$argv" = "true"
        echo -n "$green > "
    else
        echo -n "$red > "
    end
end

# === main prompt ===
function fish_prompt
    if test $status -eq 0
        set success true
    else
        set success false
    end

    workingDir
    get_branch
    indicator "$success"
        
end
