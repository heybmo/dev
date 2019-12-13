# Functions to help this project remain portable.


function portable::Is_zsh() {
  [ -n "${ZSH_VERSION-}" ]
}

function portable::Is_bash() {
    [ -n "${BASH_VERSION}"]
}

function portable::Echo() {
    command printf %s\\n "$*" 2>/dev/null;
}

function portable::Has() {
    type "${1-}" >/dev/null 2>&1;
}

function portable::Has_non_aliased() {
    nvm_has "${1-}" && ! nvm_is_alias "${1-}";
}

function portable::Is_alias() {
    # this is intentionally not "command alias" so it works in zsh.
    \alias "${1-}" >/dev/null 2>&1;
}

function portable::Has_color_support() {
    local COLORS;
    if has tput; then
        COLORS="$(tput -T "${TERM:-vt100}" colors)";
    fi
    [ "${COLORS:--1}" -ge 8 ];
}

function portable::Which_shell() {
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     machine=Linux;;
        Darwin*)    machine=Mac;;
        CYGWIN*)    machine=Cygwin;;
        MINGW*)     machine=MinGw;;
        *)          machine="UNKNOWN:${unameOut}"
    esac
    echo ${machine}
}

function portable::Contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

