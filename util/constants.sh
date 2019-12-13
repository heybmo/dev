# Constant variables needed for this project.

__THIS_SCRIPT="$( cd "$(dirname "$0")" ; pwd -P )"

UTIL_DIR="$(dirname ${__THIS_SCRIPT})";
ROOT_DIR="$(dirname ${UTIL_DIR})";

export UTIL_DIR;
export ROOT_DIR;
