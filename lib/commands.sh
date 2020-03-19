# @module lib/commands.sh
# @description All exposed commands that the end user can use. All functions are
#   prefixed with `devbox`.


# General shell helper functions
alias devbox::Is_zsh=portable::Is_zsh;
alias devbox::Is_bash=portable::Is_bash;
alias devbox::Echo=portable::Echo;
alias devbox::Die=portable::Die;
alias devbox::File_exists=portable::File_exists;
alias devbox::Command_exists=portable::Command_exists;

# String helpers
alias devbox::String::Contains;
alias devbox::String::Starts_with=portable::Starts_with;
alias devbox::String::Ends_with=portable::String_ends_with;

# Module management
alias devbox::Import=module::Import;
alias devbox::Unset_all=module::Unset_private_vars;
alias devbox::File_is_shell_script=module::File_is_shell_script;
alias devbox::Create_new_lib_module=module::Create_new_lib_module;
alias devbox::Create_new_box_module=module::Create_new_box_module;
