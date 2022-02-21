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
set reset (tput sgr0) &
set bold (tput bold) &

# === FONT COLORS ===
set black (tput setaf 0) &
set red (tput setaf 1) &
set green (tput setaf 2) &
set yellow (tput setaf 3) &
set blue (tput setaf 4) &
set magenta (tput setaf 5) &
set cyan (tput setaf 6) &
set white (tput setaf 7) &

# ====================
# === INTERACTIVE  ===
# ====================

if status is-interactive
    # ===============
    # === UPDATES ===
    # ===============

    paru -Qu > ~/.config/updates.txt &

    # ===================
    # === Add aliases ===
    # ===================

    # === ls aliases ===
    alias ls='ls --color=auto' &
    alias ll='ls -lav --ignore=..' & # show a long listing of all files/folders except ".."
    alias l='ls -lav -ignore=.?*' &  # show a long listing but no hidden files except "."

    # === app aliases ===
    alias teams='flatpak run com.microsoft.Teams &'
    alias vscodium='flatpak run com.vscodium.codium &'

    # === git aliases ===
    alias gstat='git status' &
    alias gadd='git add' &
    alias gclone='git clone' &
    alias gommit='git commit' &
    alias gush='git push' &
    alias geckout='git checkout' &
    alias gomote='git remote' &
    alias giff='git diff' &
    
    # === other aliases ===
    alias screens='kanshi' &
    alias config='cd ~/Documents/coding\ repos/dotfiles/; micro fish/config.fish sys-info/ufetch-endevour.sh wayfire/wayfire.ini wayfire/wf-shell.ini alacritty/alacritty.yml wofi/styles.css mako/config' &
    alias pacman='sudo pacman' &
    alias wayfire='dbus-run-session wayfire' &
    alias concd='cd ~/Documents/coding\ repos/dotfiles/'
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

# === updates ===
function updates
    set updates (cat ~/.config/updates.txt | wc -l)
    if test "$updates" != "0"; or test "$updates" != ""
        echo -n "$reset with $red$updates$reset updates"
    end
end

# === git ===
function git_info
    set branch_name (git rev-parse --abbrev-ref HEAD 2> /dev/null)
    
    if test "$branch_name" != ""
        echo -n "$reset on$cyan $branch_name" # if we are on a git folder
        git_changes
    end
end

function git_branch
    
end

function git_changes
    # /dev/null prevents nonsensical errors when you are on directories not tracked by git
    set changesLNs (git status --untracked-files=no 2> /dev/null | wc -l)
    set changes (expr $changesLNs - 9)
    
    if test $changes -eq 0
        set changesText "no changes"
    else if test $changes -gt 1
        set changesText "$changes changes"
    else
        set changesText "1 change" 
    end
    
    echo -n "$reset with$cyan $changesText"
end

# === computer hostname ===
function Hostname
    set hostname_ (hostname)
    echo -n "$reset from $magenta$hostname_"
end

# === computer user ===
function usr
    set user (whoami)
    echo -n "$reset as $yellowfish$user"
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
    git_info
    updates
    indicator "$success"
        
end
