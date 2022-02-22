#!/usr/bin/bash
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
exec 3>&1
username=$(dialog \
    --backtitle "Login-Tool" \
    --title "Please Enter Your Username" \
    --inputbox "" \
        7 51 2>&1 1>&3)
return_value=$?
exec 3>&-
case $return_value in
    $DIALOG_OK)
        ;;
    $DIALOG_CANCEL)
        exit
        ;;
esac
clear
su - $username