cp i3/config ~/.config/i3/config
cp nvim/init.vim ~/.config/nvim/init.vim
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
echo "#Compton"
cp $DIR/compton/"$ENV"_compton.conf $CONFIGDIR/compton.conf
#git
echo "#Git"
if [ -a $DIR/git/"$ENV"_gitconfig ]; then
    cp $DIR/git/"$ENV"_gitconfig $HOME/.gitconfig
else
    cp $DIR/git/gitconfig $HOME/.gitconfig
fi
