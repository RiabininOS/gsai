#!/bin/bash

#echo "m_echo.sh loaded"

sleep $SLEEP

#########################
### CONSTS FOR m_echo ###
#########################
#region

### general consts
E_0="\033[0m"  # all default
E_1="\033[1m"  # bold mode
E_2="\033[2m"  # faint text mode (полуяркий)
E_3="\033[3m"  # italic mode
E_4="\033[4m"  # underline mode
E_5="\033[5m"  # blink mode

### font colors
E_F_0="\033[30m" # black (?gray) 
E_F_1="\033[31m" # red
E_F_2="\033[32m" # green
E_F_3="\033[33m" # yellow
E_F_4="\033[34m" # blue
E_F_5="\033[35m" # magenta
E_F_6="\033[36m" # cyan
E_F_7="\033[37m" # light gray (?white)

### background colors
E_B_0="\033[40m" # black (?gray)      
E_B_1="\033[41m" # red       
E_B_2="\033[42m" # green     
E_B_3="\033[43m" # yellow    
E_B_4="\033[44m" # blue      
E_B_5="\033[45m" # magenta   
E_B_6="\033[46m" # cyan      
E_B_7="\033[47m" # light gray (?white)

#endregion

#######################
### m_echo function ###
#######################
#region
function m_echo() {
    echo -e "$@ $E_0"
    sleep $SLEEP

}
#endregion

function m_echo_ok() {
    m_echo $E_5 $E_1 $E_B_2 "[ ok ] $E_0 $@"
    sleep $SLEEP
} 

function m_echo_fail {
    m_echo $E_5 $E_1 $E_B_1 "[ ok ] $E_0 $@"
    sleep $SLEEP
}

###################
### RUN SECTION ###
###################
m_echo_ok "MODULE LOAD m_echo"

####################
### TEST SECTION ###
####################

function m_echo_test() {
m_echo $E_1 "1"
m_echo $E_2 "2"
m_echo $E_3 "3"
m_echo $E_4 "4"
m_echo $E_5 "5"

m_echo $E_F_0 "f0 "
m_echo $E_F_1 "f1 "
m_echo $E_F_2 "f2 "
m_echo $E_F_3 "f3 "
m_echo $E_F_4 "f4 "
m_echo $E_F_5 "f5 "
m_echo $E_F_6 "f6 "
m_echo $E_F_7 "f7 "

m_echo $E_B_0 "b0"
m_echo $E_B_1 "b1"
m_echo $E_B_2 "b2"
m_echo $E_B_3 "b3"
m_echo $E_B_4 "b4"
m_echo $E_B_5 "b5"
m_echo $E_B_6 "b6"
m_echo $E_B_7 "b7"

m_echo_ok "works"
m_echo_fail "works"

echo "simple echo"

}

