# Functions to help this project remain portable.


function portable::Is_zsh() {
  [ -n "${ZSH_VERSION-}" ]
}

function portable::Is_bash() {
    [ -n "${BASH_VERSION}"]
}

function portable::Echo() {
    command printf %s\\n "$*";
    return 0;
}

function portable::Die() {
    portable::Echo "$*";
    exit 1;
}

function portable::Has() {
    type "${1-}" >/dev/null 2>&1;
}

function portable::File_exists() {
    if [ "$#" -ne 1 ]; then
        portable::Echo "Invalid number of arguments.";
        return 1;
    fi

    if [ -e "$1" ] && return 0 || return 1;
}

function portable::Command_exists() {
    if [ "$#" -ne 1 ]; then
        portable::Echo "Invalid number of arguments.";
        return 1;
    fi

    command -v "$1";
}

function portable::Has_non_aliased() {
    portable::Has "${1-}" && ! nvm_is_alias "${1-}";
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
    local unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     local machine=Linux;;
        Darwin*)    local machine=Mac;;
        CYGWIN*)    local machine=Cygwin;;
        MINGW*)     local machine=MinGw;;
        *)          local machine="UNKNOWN:${unameOut}"
    esac
    echo ${machine};
    return 0;
}

function portable::Contains() {
    local string="$1"
    local substring="$2"
    
    if [ "$#" -ne 2 ]; then
        portable::Echo "Invalid number of arguments.";
        return 1;
    fi

    if test "${string#*$substring}" != "$string"; then
        return 0;    # $substring is in $string
    else
        return 1;    # $substring is not in $string
    fi
}

function portable::Starts_with() {
    local string="$1"
    local substring="$2"

    if [ "$#" -ne 2 ]; then
        portable::Echo "Invalid number of arguments.";
        return 1;
    fi

    case "$string" in
        "$substring"*) return 0 ;;
        *) return 1 ;;
    esac
}

function portable::Ends_with() {
    local string="$1";
    local substring="$2";

    if [ "$#" -ne 2 ]; then
        portable::Echo "Invalid number of arguments.";
        return 1;
    fi

    case "$string" in
        *"$substring") return 0 ;;
        *) return 1 ;;
    esac
}

