#!/bin/bash

function GettingLastConfig () {
    if [[ ${1} == "" ]] ; then
        echo "System never used. Create first config"
        elif test -d ${1} ; then
                LoadConfig ${1}
            else
                echo "temp"        
    fi
}

###################
### RUN SECTION ###
###################
m_echo_ok "MODULE LOAD config manager"