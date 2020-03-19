# Constant variables needed for this project.

localvar_THIS_SCRIPT="$( cd "$(dirname "$0")" ; pwd -P )"

DEVBOX_LOGO="
               _____             ____            
              |  __ \           |  _ \           
              | |  | | _____   _| |_) | _____  __
              | |  | |/ _ \ \ / /  _ < / _ \ \/ /
              | |__| |  __/\ V /| |_) | (_) >  < 
              |_____/ \___| \_/ |____/ \___/_/\_\\
                                    

       T                                    \\\`.    T
       |    T     .--------------.___________) \   |    T
       !    |     |//////////////|___________[ ]   !  T |
            !     \`--------------'           ) (      | !
                                             '-'      !
"

LIB_DIR="$(dirname ${localvar_THIS_SCRIPT})";
ROOT_DIR="$(dirname ${LIB_DIR})";

export DEVBOX_LIB_DIR;
export DEVBOX_ROOT_DIR;
