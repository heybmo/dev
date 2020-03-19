#  ____  _______     __
# |  _ \| ____\ \   / /
# | | | |  _|  \ \ / / 
# | |_| | |___  \ V /  
# |____/|_____|  \_/   
#         
# Dev CLI Tool for managing the environment + providing helpful shell utility
# functions. Compatible with most shells, but mainly `bash`, `zsh`, and `sh`.


localvar_ROOT_DIR="$( cd "$(dirname "$0")" ; pwd -P )";


# Require base files.
source "${localvar_ROOT_DIR}/init.sh";

if [[ ! -e .initialized ]]; then
  export localvar_FIRST_RUN=1;
  touch .initialized;
fi


for new_install in "${localvar_ROOT_DIR}/installs"/*(.); do
  local package_script_name="$(basename "$new_install")";

  source "$new_install";

  if module::File_is_public "$package_script_name" && ! install::Check_installed; then
    # Check all `installs` scripts to make sure packages are installed.
    if ! portable::Command_exists "$DEVBOX_COMMAND_NAME"; then
      portable::Echo "Installing: $package_script_name";
    fi
  fi
done


