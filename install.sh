
echo "Wellcome to DOTFILES"
echo "Install:"
echo "	- tmux"
echo "	- zsh"

rm $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
