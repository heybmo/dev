#!/usr/bin/env zsh
# @module <BOX_MODULE_PATH>
# @description Template file for new install scripts.


# @function install::Check_install
# @description: Check that the package is already installed. If it is not,
#    return a non-zero status code.
# @retur 1 (error status) if the package is not installed yet, 0 otherwise.
function install::Check_installed() {

}

# @function install::Do_install
# @description All logic that pertains to package installs should go in here.
#   Verification logic should not exist in this function.
# @return 1 (error status) if the install failed; 0 otherwise.
function install::Do_install() {
}


# @function install::Verify_install
# @description All logic that pertains to verifying the package install should
#   go in here.
# @return 1 (error status) if the install failed; 0 otherwise.
function install::Verify_install() {
}