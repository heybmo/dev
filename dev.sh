#  ____  _______     __
# |  _ \| ____\ \   / /
# | | | |  _|  \ \ / / 
# | |_| | |___  \ V /  
# |____/|_____|  \_/   
#         
# Dev CLI Tool for managing the environment + providing helpful shell utility
# functions. Compatible with most shells, but mainly `bash`, `zsh`, and `sh`.

__dev_logo = "
    ____  _______     __
   |  _ \| ____\ \   / /
   | | | |  _|  \ \ / / 
   | |_| | |___  \ V /  
   |____/|_____|  \_/   
"

function is_zsh() {
  [ -n "${ZSH_VERSION-}" ]
}

