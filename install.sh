echo "Welcome to DOTFILES"
echo "Install:"
echo "  - tmux"
echo "  - zsh"

if ! [ -d "$HOME/.zshrc" ] ; then
    rm $HOME/.zshrc
fi
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

if ! [ -d "$HOME/.p10k.zsh" ] ; then
    rm $HOME/.p10k.zsh
fi
ln -s $HOME/.dotfiles/.p10k.zsh $HOME/.p10k.zsh

