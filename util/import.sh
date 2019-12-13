# Provides utility functions to allow "importing" of various shell scripts.
# Since there isn't really a concept of "importing" in most shells (you can just
# `source` the file to get the module's functions and variables), this is more
# of an abstraction on namespacing.

local::THIS_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
source "${local::THIS_DIR}/constants.sh";
source "${local::THIS_DIR}/portable.sh";

function import::Is_shell_script() {

}

function import::Import() {
    for dep in "$@"
    do
        if case $string in "local_"*) true;; *) false;; esac; then
            echo "$line starts with an exclamation mark"
      
        else
            echo "$line does not start with an exclamation mark"
        fi
}