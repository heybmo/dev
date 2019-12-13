# Init script. Put this in your .*rc file or your .profile to make sure it gets
# run on shell start up.
export project_init_status="OK";

__THIS_DIR="$( cd "$(dirname "$0")" ; pwd -P )";
source "${__THIS_DIR}/util/constants.sh";
source "${__THIS_DIR}/util/portable.sh";
source "${__THIS_DIR}/util/import.sh";
