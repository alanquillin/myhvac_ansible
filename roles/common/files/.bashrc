# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac


#------------------------------------------////
# Colors:
#------------------------------------------////
black='\\\\e[0;30m'
blue='\\\\e[0;34m'
green='\\\\e[0;32m'
cyan='\\\\e[0;36m'
red='\\\\e[0;31m'
purple='\\\\e[0;35m'
brown='\\\\e[0;33m'
lightgray='\\\\e[0;37m'
darkgray='\\\\e[1;30m'
lightblue='\\\\e[1;34m'
lightgreen='\\\\e[1;32m'
lightcyan='\\\\e[1;36m'
lightred='\\\\e[1;31m'
lightpurple='\\\\e[1;35m'
yellow='\\\\e[1;33m'
white='\\\\e[1;37m'
nc='\\\\e[0m'

# Sexy Solarized Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Customized for the Solarized color scheme by Sean O'Neil

if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then TERM=gnome-256color; fi
if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      BASE03=$(tput setaf 234)
      BASE02=$(tput setaf 235)
      BASE01=$(tput setaf 240)
      BASE00=$(tput setaf 241)
      BASE0=$(tput setaf 244)
      BASE1=$(tput setaf 245)
      BASE2=$(tput setaf 254)
      BASE3=$(tput setaf 230)
      YELLOW=$(tput setaf 226)
      ORANGE=$(tput setaf 166)
      RED=$(tput setaf 160)
      MAGENTA=$(tput setaf 125)
      VIOLET=$(tput setaf 61)
      BLUE=$(tput setaf 33)
      CYAN=$(tput setaf 37)
      GREEN=$(tput setaf 46)
      WHITE=$(tput setaf 255)
      BLACK=$(tput setaf 236)
    else
      BASE03=$(tput setaf 8)
      BASE02=$(tput setaf 0)
      BASE01=$(tput setaf 10)
      BASE00=$(tput setaf 11)
      BASE0=$(tput setaf 12)
      BASE1=$(tput setaf 14)
      BASE2=$(tput setaf 7)
      BASE3=$(tput setaf 15)
      YELLOW=$(tput setaf 3)
      ORANGE=$(tput setaf 9)
      RED=$(tput setaf 1)
      MAGENTA=$(tput setaf 5)
      VIOLET=$(tput setaf 13)
      BLUE=$(tput setaf 4)
      CYAN=$(tput setaf 6)
      GREEN=$(tput setaf 2)
      WHITE=$(tput setaf 7)
      BLACK=$(tput setaf 0)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    # Linux console colors. I don't have the energy
    # to figure out the Solarized values
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi


#----------------------------------------------
# Source extended bash configs
#----------------------------------------------
# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

if [ -f ~/.git-promt.sh ]; then
    . ~/.git-prompt.sh
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
[[ $startup_cmd ]] && {
    declare +x startup_cmd
    eval "$startup_cmd"
}


PATH=$PATH:~/bin
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

#------------------------------------------////
# Terminal prompt and welcome message:
#------------------------------------------////
clear
dofiglet=true
command -v figlet >/dev/null 2>&1 || dofiglet=false
echo -ne "${RED}Welcome to: \t\t${CYAN}$HOSTNAME ${RESET}"
echo -ne "${RED}Today is: \t\t${CYAN}" `date`; echo "${RESET}"
echo -e "${RED}Kernel Information: \t${CYAN}" `uname -smr`; echo "${RESET}"
echo "
${WHITE}MMMMMMMM               MMMMMMMM                       HHHHHHHHH     HHHHHHHHHVVVVVVVV           VVVVVVVV   AAA                  CCCCCCCCCCCCC
${WHITE}M:::::::M             M:::::::M                       H:::::::H     H:::::::HV::::::V           V::::::V  A:::A              CCC::::::::::::C
${RED}M::::::::M           M::::::::M                       H:::::::H     H:::::::HV::::::V           V::::::V A:::::A           CC:::::::::::::::C
${RED}M:::::::::M         M:::::::::M                       HH::::::H     H::::::HHV::::::V           V::::::VA:::::::A         C:::::CCCCCCCC::::C
${RED}M::::::::::M       M::::::::::Myyyyyyy           yyyyyyyH:::::H     H:::::H   V:::::V           V:::::VA:::::::::A       C:::::C       CCCCCC
${RED}M:::::::::::M     M:::::::::::M y:::::y         y:::::y H:::::H     H:::::H    V:::::V         V:::::VA:::::A:::::A     C:::::C
${YELLOW}M:::::::M::::M   M::::M:::::::M  y:::::y       y:::::y  H::::::HHHHH::::::H     V:::::V       V:::::VA:::::A A:::::A    C:::::C
${YELLOW}M::::::M M::::M M::::M M::::::M   y:::::y     y:::::y   H:::::::::::::::::H      V:::::V     V:::::VA:::::A   A:::::A   C:::::C
${YELLOW}M::::::M  M::::M::::M  M::::::M    y:::::y   y:::::y    H:::::::::::::::::H       V:::::V   V:::::VA:::::A     A:::::A  C:::::C
${YELLOW}M::::::M   M:::::::M   M::::::M     y:::::y y:::::y     H::::::HHHHH::::::H        V:::::V V:::::VA:::::AAAAAAAAA:::::A C:::::C
${BLUE}M::::::M    M:::::M    M::::::M      y:::::y:::::y      H:::::H     H:::::H         V:::::V:::::VA:::::::::::::::::::::AC:::::C
${BLUE}M::::::M     MMMMM     M::::::M       y:::::::::y       H:::::H     H:::::H          V:::::::::VA:::::AAAAAAAAAAAAA:::::AC:::::C       CCCCCC
${BLUE}M::::::M               M::::::M        y:::::::y      HH::::::H     H::::::HH         V:::::::VA:::::A             A:::::AC:::::CCCCCCCC::::C
${BLUE}M::::::M               M::::::M         y:::::y       H:::::::H     H:::::::H          V:::::VA:::::A               A:::::ACC:::::::::::::::C
${GREEN}M::::::M               M::::::M        y:::::y        H:::::::H     H:::::::H           V:::VA:::::A                 A:::::A CCC::::::::::::C
${GREEN}MMMMMMMM               MMMMMMMM       y:::::y         HHHHHHHHH     HHHHHHHHH            VVVAAAAAAA                   AAAAAAA   CCCCCCCCCCCCC
${GREEN}                                     y:::::y
${GREEN}                                    y:::::y
${WHITE}                                   y:::::y
${WHITE}                                  y:::::y
${WHITE}                                 yyyyyyy
"
PS1="\[${BOLD}${YELLOW}\]\u\[$BASE0\]@\[$CYAN\]\h \[$BASE0\]in \[$BLUE\]\w \$(parse_git_prompt)\[$RESET\]\n\$ \[$RESET\]"

export IBUS_ENABLE_SYNC_MODE=1