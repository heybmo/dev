#!/usr/bin/env zsh
# @module init.sh
# @description Set up this project in the current environment. Imports the `lib/*`
#   shell scripts in the proper order to get the project started.
export devbox_project_init_status="OK";

localvar_THIS_DIR="$( cd "$(dirname "$0")" ; pwd -P )";
source "${localvar_THIS_DIR}/lib/constants.sh";
source "${localvar_THIS_DIR}/lib/portable.sh";
source "${localvar_THIS_DIR}/lib/module.sh";

