# Provides utility functions to allow "importing" of various shell scripts.
# Since there isn't really a concept of "importing" in most shells (you can just
# `source` the file to get the module's functions and variables), this is more
# of an abstraction on namespacing.

localvar_THIS_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
source "${localvar_THIS_DIR}/constants.sh";
source "${localvar_THIS_DIR}/portable.sh";


function module::Unset_private_vars() {
    unset $(env | sed -n 's/^\(localvar_.*\)=.*/\1/p');
}

function module::File_is_shell_script() {
    if portable::Ends_with "$1" "sh"; then
        return 0;
    else
        return 1;
    fi
}

function module::File_is_public() {
    if portable::Starts_with "$1" "_"; then
        return 1;
    elif portable::Contains "$1" "private."; then
        return 1;
    else
        return 0;
    fi
}

function module::Create_new_lib_module() {
    if portable::File_exists "$localvar_THIS_DIR/$1"; then
        portable::Echo "Could not create new file: $1 since it already exists.";
        return 1;
    fi

    cp "$localvar_THIS_DIR/../templates/base.template.sh" "$localvar_THIS_DIR/";
    mv "$localvar_THIS_DIR/base.template.sh" "$localvar_THIS_DIR/$1.sh";
}

function module::Create_new_box_module() {
    local help_text="
    1st argument: One of: installs, scripts, templates, aliases
    2nd argument: The filename, without the file extension.

    Example:

    \$ module::Create_new_box_module installs my_install_file_name
    "

    if [ "$#" -ne 2 ]; then
        portable::Echo "Invalid number of arguments.";
        portable::Echo "$help_text";
        return 1;
    fi

    # Validate positional arguments.
    if  ! portable::Contains "aliases scripts templates installs" "$1"; then
        portable::Echo "$help_text";
        return 1;

    elif portable::Ends_with "$1" "sh"; then
        portable::Echo "Please supply a file name _without_ the extension";
        return 1;
    fi

    # Ensure that the file doesn't already exist.
    if portable::File_exists "$localvar_THIS_DIR/../$1/$2.sh"; then
        portable::Echo "Could not create new file: $1 since it already exists.";
        return 1;
    fi

    # Create a copy of the template and rename it.
    local ftype="$1";
    local fname="$2";
    local proj_dir="$localvar_THIS_DIR/..";

    cp "$proj_dir/templates/$ftype.template.sh" "$proj_dir/$ftype/$ftype.template.sh";
    mv "$proj_dir/$ftype/$ftype.template.sh" "$proj_dir/$ftype/$fname.sh";
    return 0;
}

# @function module::Import
# @desc Import a shell script. Checks the following parameters:
#   - Is a shell script (looks at extension, must end in `.sh`)
#   - Is not marked as private (does not start with `_`)
#   - File exists
#   If all these criteria are met, the module is imported. Any variable that is
#   namespaced as `localvar_` is automatically not imported into the current
#   script. You should not attempt to use any variable that starts with
#   `localvar_`; this behavior is indeterminate.
#
# @arguments:
#   $@: At least 1 or more modules to import, separated by spaces. Module names
#       with spaces should be properly escaped and wrapped in quotes.
function module::Import() {
    for dep in "$@"; do
        if module::File_is_shell_script "$dep"; then
            if module::File_is_public "$dep"; then
                if portable::File_exists "$dep"; then
                    source "$dep";
                else
                    portable::Echo "Could not import $dep; file does not exist."
                fi
            else
                # Any file name prefixed with "_" is ignored. Example:
                # "_testing.sh" is ignored, but a file like "testing_file.sh" is
                # not.
                portable::Echo "Could not import $dep; file is marked as private."
            fi
        else
            # The path was determined to be a non-shell script since it did not
            # end in "sh". This is a naive check and may need to be updated in the
            # future to be more robust.
            portable::Echo "Could not import '$dep'; file is not a shell script."
        fi

    done
}
