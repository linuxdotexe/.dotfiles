#!/bin/bash

filename=`ls $HOME/.appimages/*.AppImage`

sed -i '$ d' $HOME/.local/share/applications/remnote.desktop

echo Exec=$filename >> $HOME/.local/share/applications/remnote.desktop
