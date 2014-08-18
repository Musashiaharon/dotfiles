#!/bin/bash

this_dir="$(dirname "$0")"

. "$this_dir"/utils/addDockItem.sh

echo Clear the dock\'s apps
defaults write com.apple.dock persistent-apps -array

echo Setting the dock\'s apps
for item in \
    /Applications/Time\ Machine.app \
    /Applications/Safari.app \
    /Applications/Google\ Chrome.app \
    /Applications/Airmail.app \
    /Applications/Address\ Book.app \
    /Applications/Contacts.app \
    /Applications/iCal.app \
    /Applications/Calendar.app \
    /Applications/iTerm.app \
; do
    if [[ -d "$item" ]]; then
        addDockApp "$item"
    fi
done


echo Dim hidden apps in the dock
defaults write com.apple.dock showhidden -bool true

killall Dock
    
