# Init script. Put this in your .*rc file or your .profile to make sure it gets
# run on shell start up.
export dev::Project_init_status=1;

local::THIS_DIR="$( cd "$(dirname "$0")" ; pwd -P )";
source "${local::THIS_DIR}/util/constants.sh";
source "${local::THIS_DIR}/util/portable.sh";
source "${local::THIS_DIR}/util/import.sh";