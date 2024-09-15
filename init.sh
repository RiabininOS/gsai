#!/bin/bash

clear
tput sgr0

################################
### PRIMARY SCRIPT CONSTANTS ###
################################
#region

readonly SCRIPT_VERSION="0.0.0.2"
readonly SCRIPT_VERSION_DATE="09.05.2024"


readonly SCRIPT_DIR_BASIC=$(dirname "$0")
readonly SCRIPT_DIR_MODULES="${SCRIPT_DIR_BASIC}/modules"
readonly SCRIPT_DIR_CONFIGS="${SCRIPT_DIR_BASIC}/_configs"
readonly SCRIPT_DIR_HELP="${SCRIPT_DIR_BASIC}/_help"

readonly SCRIPT_ARGS=$@

readonly CONFIGS_LAST_USED=$(cat ${SCRIPT_DIR_CONFIGS}/last_used.conf)
#endregion

DEFAULT_SLEEP=1
SLEEP=0

####################
### LOAD MODULES ###
####################
#region

source ${SCRIPT_DIR_MODULES}/00.sh
source ${SCRIPT_DIR_MODULES}/01.sh
source ${SCRIPT_DIR_MODULES}/02.sh

#endregion

#######################
### CHOOSING CONFIG ###
#######################
#region



#endregion

###################
### TEST REGION ###
###################
#region

# m_echo_test

#endregion