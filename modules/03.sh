#!/bin/bash

#################
### FUNCTIONS ###
#################

# get txt/info files
#region
function GetInfoFile () {

    local L_BASE_URL="https://distfiles.gentoo.org/releases/amd64/autobuilds"

    local L_URL=${L_BASE_URL}/${2}
    local L_OUTPUT_FILE=${SCRIPT_DIR_BASIC}/${1}/${2}

    touch $L_OUTPUT_FILE
    wget -q $L_URL -O $L_OUTPUT_FILE 

    echo "info loaded on ${2}"
}
#endregion

# check files
function CheckFiles() {

    local L_BASE_URL="https://distfiles.gentoo.org/releases/amd64/autobuilds"

    # check isoes
    cd ${SCRIPT_DIR_ISOES}

    for L_FILE in ${SCRIPT_DIR_ISOES}/* ; do
        local L_FILENAME=$(cat ${L_FILE} | grep .iso | awk '{ print $1 }')

        if [ -f $(echo ${L_FILENAME} | cut -d '/' -f 2) ] ; then
            echo "$L_FILENAME exist"
            else 
                echo loading $(echo ${L_FILENAME} | cut -d '/' -f 2)
                echo

                touch ${SCRIPT_DIR_ISOES}/$(echo ${L_FILENAME} | cut -d '/' -f 2)
                #echo "======>" $(echo ${L_FILENAME} | cut -d '/' -f 2)
                wget ${L_BASE_URL}/${L_FILENAME} -O ${SCRIPT_DIR_ISOES}/$(echo ${L_FILENAME} | cut -d '/' -f 2) 
                m_echo_ok $L_FILENAME loaded
        fi
    done
    # check stages

    cd ${SCRIPT_DIR_STAGES}

    for L_FILE in ${SCRIPT_DIR_STAGES}/* ; do
        local L_FILENAME=$(cat ${L_FILE} | grep .tar.xz | awk '{ print $1 }')

        if [ -f $(echo ${L_FILENAME} | cut -d '/' -f 2) ] ; then
            echo "$L_FILENAME exist"
            else 
                echo loading $(echo ${L_FILENAME} | cut -d '/' -f 2)
                echo

                touch ${SCRIPT_DIR_STAGES}/$(echo ${L_FILENAME} | cut -d '/' -f 2)
                #echo "======>" $(echo ${L_FILENAME} | cut -d '/' -f 2)
                wget ${L_BASE_URL}/${L_FILENAME} -O ${SCRIPT_DIR_STAGES}/$(echo ${L_FILENAME} | cut -d '/' -f 2) 
                m_echo_ok $L_FILENAME loaded
        fi
    done
    
}
#region

#endregion

##############################
### CHECKING ISO AND STAGE ###
##############################

### gettint latest ISO

cd ${SCRIPT_DIR_ISOES}
rm -f *.txt  

GetInfoFile _isoes latest-install-amd64-minimal.txt
GetInfoFile _isoes latest-livegui-amd64.txt
GetInfoFile _isoes latest-admincd-amd64.txt

### gettint latest ISO

cd ${SCRIPT_DIR_STAGES}
rm -f *.txt  

GetInfoFile _stages latest-stage3-amd64-desktop-openrc.txt	 
GetInfoFile _stages latest-stage3-amd64-desktop-systemd.txt	 
GetInfoFile _stages latest-stage3-amd64-hardened-openrc.txt	 
GetInfoFile _stages latest-stage3-amd64-hardened-selinux-openrc.txt	 
GetInfoFile _stages latest-stage3-amd64-hardened-systemd.txt	 
GetInfoFile _stages latest-stage3-amd64-llvm-openrc.txt	 
GetInfoFile _stages latest-stage3-amd64-llvm-systemd.txt	 
GetInfoFile _stages latest-stage3-amd64-musl-hardened.txt	 
GetInfoFile _stages latest-stage3-amd64-musl-llvm.txt	 
GetInfoFile _stages latest-stage3-amd64-musl.txt	 
GetInfoFile _stages latest-stage3-amd64-nomultilib-openrc.txt	 
GetInfoFile _stages latest-stage3-amd64-nomultilib-systemd.txt	 
GetInfoFile _stages latest-stage3-amd64-openrc-splitusr.txt	 
GetInfoFile _stages latest-stage3-amd64-openrc.txt	 
GetInfoFile _stages latest-stage3-amd64-systemd.txt	 
GetInfoFile _stages latest-stage3-x32-openrc.txt	 
GetInfoFile _stages latest-stage3-x32-systemd.txt	 
#latest-stage3.txt	 

CheckFiles

cd ${SCRIPT_DIR_BASIC}