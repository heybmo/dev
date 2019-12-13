#  ____  _______     __
# |  _ \| ____\ \   / /
# | | | |  _|  \ \ / / 
# | |_| | |___  \ V /  
# |____/|_____|  \_/   
#         
# Dev CLI Tool for managing the environment + providing helpful shell utility
# functions. Compatible with most shells, but mainly `bash`, `zsh`, and `sh`.

function is_zsh() {
  [ -n "${ZSH_VERSION-}" ]
}

