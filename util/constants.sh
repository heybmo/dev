# Constant variables needed for this project.

local::THIS_SCRIPT="$( cd "$(dirname "$0")" ; pwd -P )"

constants::UTIL_DIR="$(dirname ${local::THIS_SCRIPT})"
constants::ROOT_DIR="$(dirname ${constants::UTIL_DIR})"