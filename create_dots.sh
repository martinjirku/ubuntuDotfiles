if [ -f $HOME/.bashrc ]
then
	rm $HOME/.bashrc
fi
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
