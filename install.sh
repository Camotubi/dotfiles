#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"
if [ "$1" == "" ]; then
    ENV="desktop"
else
    ENV=$1
fi
CONFIGDIR="$HOME/.config"
#Neovim config
echo "#Neovim"
cp $DIR/nvim/"$ENV"_init.vim $CONFIGDIR/nvim/init.vim
#Dunst config
echo "#Dunst"
cp $DIR/dunst/"$ENV"_dunstrc $CONFIGDIR/dunst/dunstrc
#i3 config
echo "#I3"
cp $DIR/i3/"$ENV"_config $CONFIGDIR/i3/config
#compton
cp $DIR/compton"$ENV"_compton.conf $CONFIGDIR/compton.conf
