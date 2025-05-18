# ~/.bashrc: Executed by bash for non-login shells.

# ────────────────────────────────────────────
#  Exit if not running interactively
# ────────────────────────────────────────────
case $- in
    *i*) ;;
      *) return;;
esac

# ────────────────────────────────────────────
#  History settings
# ────────────────────────────────────────────
HISTCONTROL=ignoreboth   # Ignore duplicate entries and leading spaces
shopt -s histappend      # Append history instead of overwriting
HISTSIZE=10000           # Number of commands in memory
HISTFILESIZE=20000       # Number of commands in history file

# ────────────────────────────────────────────
#  Terminal size auto-adjust
# ────────────────────────────────────────────
shopt -s checkwinsize

# ────────────────────────────────────────────
#  Enable '**' to match subdirectories
# ────────────────────────────────────────────
shopt -s globstar

# ────────────────────────────────────────────
#  Less: Improve handling of non-text input files
# ────────────────────────────────────────────
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ────────────────────────────────────────────
#  Enable color support for ls, grep, etc.
# ────────────────────────────────────────────
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# ────────────────────────────────────────────
#  Useful Aliases & Shortcuts
# ────────────────────────────────────────────
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias mkdir='mkdir -pv'
alias c='clear'
alias h='history'
alias update='sudo apt update && sudo apt upgrade -y'
alias ports='netstat -tulanp'
alias usage='df -h'
alias myip='curl ifconfig.me'
alias meminfo='free -h'
alias cpuinfo='lscpu'
alias top10='ps aux --sort=-%mem | head -11'
alias alert='notify-send "Command Finished" "$(history | tail -n1 | sed -e "s/^\s*[0-9]\+\s*//")"'

# Show disk usage of current folder
alias du1='du -h --max-depth=1'

# Smart file search
alias findf='find . -type f -iname'

# ────────────────────────────────────────────
#  Load additional aliases if available
# ────────────────────────────────────────────
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# ────────────────────────────────────────────
#  Enable programmable completion
# ────────────────────────────────────────────
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# ────────────────────────────────────────────
#  Custom Powerline Theme (Green & Yellow on Black)
# ────────────────────────────────────────────
TIME_COLOR="\[\033[1;33m\]"   # Yellow
USER_COLOR="\[\033[1;32m\]"   # Green
DIR_COLOR="\[\033[1;36m\]"    # Cyan
GIT_COLOR="\[\033[1;35m\]"    # Magenta
ERROR_COLOR="\[\033[1;31m\]"  # Red
RESET="\[\033[0m\]"           # Reset to default

# Icons for Prompt
ICON_USER="👤"      # User icon
ICON_HOST="🖥️ "    # Host icon
ICON_FOLDER="📂"    # Folder icon
ICON_GIT="🌿"       # Git branch icon
ICON_ERROR="❌"     # Error icon

# ────────────────────────────────────────────
#  Functions for Enhanced Prompt
# ────────────────────────────────────────────

# Show current Git branch (if in a repo)
git_branch() {
    git branch 2>/dev/null | sed -n 's/* \(.*\)/ (\1)/p'
}

# Show exit status if last command failed
exit_status() {
    local status=$?
    if [ $status -ne 0 ]; then
        echo -e "${ERROR_COLOR}${ICON_ERROR} [Error: $status]${RESET}"
    fi
}

# ────────────────────────────────────────────
#  Define Powerline Prompt
# ────────────────────────────────────────────
export PS1="${TIME_COLOR}⏳[\$(date +%H:%M)]${RESET} \
${USER_COLOR}${ICON_USER} \u${RESET} \
${USER_COLOR}${ICON_HOST} \h${RESET} \
${DIR_COLOR}${ICON_FOLDER} \w${RESET} \
${GIT_COLOR}${ICON_GIT}\$(git_branch)${RESET} \
\$(exit_status) \$ "
