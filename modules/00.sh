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

    case ${1} in
        "")
            HF="${SCRIPT_DIR_HELP}/help.txt"
            ;;
        "clean")
            HF="${SCRIPT_DIR_HELP}/help_clean.txt"
            ;;
        "sleep")
            HF="${SCRIPT_DIR_HELP}/help_sleep.txt"
            ;;
        "version")
            HF="${SCRIPT_DIR_HELP}/help_version.txt"
            ;;
            
            
        *)
            ;;
    esac

    cat ${HF} | less

    exit 0

}
#endregion

#########################
### ARGUMENTS READING ###
#########################

    # no args
    # --clean
    # --sleep
    # --version

PrintVersion

case $SCRIPT_ARGS in
    "")
        echo -e "no args \n"
        ;;
    *"--clean"*)
        cd ${SCRIPT_DIR_ISOES}
        rm -f *
        cd ${SCRIPT_DIR_STAGES}
        rm -f *
        cd ${SCRIPT_DIR_BASIC}
        ;;
    ### HELP SECTION ###
    #region        
    *"--help clean"*)
        echo "help section"
        PrintHelpPage "clean"
        exit 0
        ;;

    *"--help sleep"*)
        echo "help section"
        PrintHelpPage "sleep"
        exit 0
        ;;

    *"--help version"*)
        echo "help section"
        PrintHelpPage "version"
        exit 0
        ;;


    *"--help"*)
        echo "help section"
        PrintHelpPage
        exit 0
        ;;
    #endregion

    *"--sleep"*)
        echo "delay turned on"
        SLEEP=$DEFAULT_SLEEP
        ;;
    *"--version"*)
        PrintVersion
        exit 0
        ;;

esac