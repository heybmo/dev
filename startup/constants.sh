# Constant variables needed for this project.

localvar_THIS_SCRIPT="$( cd "$(dirname "$0")" ; pwd -P )"

UTIL_DIR="$(dirname ${localvar_THIS_SCRIPT})";
ROOT_DIR="$(dirname ${UTIL_DIR})";

export UTIL_DIR;
export ROOT_DIR;
