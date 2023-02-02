#!/bin/bash

filename=`ls $HOME/.appimages/*.AppImage`

new_name='Execs=${!filename}' 

# echo $filename

sed -i '$ d' $HOME/.local/share/applications/remnote.desktop

echo Exec=$filename >> $HOME/.local/share/applications/remnote.desktop
