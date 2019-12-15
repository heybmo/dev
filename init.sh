# Init script. Put this in your .*rc file or your .profile to make sure it gets
# run on shell start up.
export project_init_status="OK";

localvar_THIS_DIR="$( cd "$(dirname "$0")" ; pwd -P )";
source "${localvar_THIS_DIR}/startup/constants.sh";
source "${localvar_THIS_DIR}/startup/portable.sh";
source "${localvar_THIS_DIR}/startup/module.sh";
