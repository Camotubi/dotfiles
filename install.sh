#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"
if [ "$1" == "" ]; then
    ENV="desktop"
else
    ENV=$1
fi
CONFIGDIR="$HOME/.config"
#Neovim config
echo "#NeoVim"
cp $DIR/nvim/"$ENV"_init.vim $CONFIGDIR/nvim/init.vim
#Dunst config
cp $DIR/dunst/"$ENV"_dunstrc $CONFIGDIR/dunst/dunstrc
#i3 config
cp $DIR/i3/"$ENV"_config $CONFIGDIR/i3/config
#compton
cp $DIR/compton"$ENV"_compton.conf $CONFIGDIR/compton.conf
