#!/bin/bash

#################
### FUNCTIONS ###
#################

### PRINT VERSION
#region
function PrintVersion () {
    echo "gsai version: ${SCRIPT_VERSION}"
    echo "version date: ${SCRIPT_VERSION_DATE}"
    echo
}
#endregion

### PRINT HELP
#region
function PrintHelpPage () {
    sleep $SLEEP
    clear

    PrintVersion

    echo -e "\
+------------------------------------------------------------------------------+\n\
| Possible arguments:                                                          |\n\
| -- help                                                                      |\n\
|       prints help page. May be used with extra args.                         |\n\
|       example:                                                               |\n\
|       # ./init.sh --help sleep                                               |\n\
|                                                                              |\n\
| --sleep                                                                      |\n\
|       turns on delay between steps. Default value - 3 seconds                |\n\
| -- version                                                                   |\n\
|       shows current version of script                                        |\n\
|                                                                              |\n\
+------------------------------------------------------------------------------+"

}
#endregion

#########################
### ARGUMENTS READING ###
#########################

PrintVersion

case $SCRIPT_ARGS in
    "")
        echo -e "no args \n"
        ;;
    *"--help"*)
        echo "help section"
        PrintHelpPage
        exit 0
        ;;
    *"--sleep"*)
        echo "delay turned on"
        SLEEP=1
        ;;
    *"--version"*)
        PrintVersion
        exit 0
        ;;

esac