if [ -f $HOME/.bashrc ]
then
	rm $HOME/.bashrc
fi
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc

if [ -f $HOME/.vimrc ]
then
	mv $HOME/.vimrc $HOME/._vimrc
fi
ln -s $HOME/dotfiles/vim/.vimrc $HOME/.vimrc
