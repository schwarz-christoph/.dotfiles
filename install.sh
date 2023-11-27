echo "Welcome to DOTFILES"
echo "Install:"
echo "  - sway"
echo "  - swaylock"
echo "  - waybar"
echo "  - rofi"
echo "  - tmux"
echo "  - zsh"
echo "  - xdg-desktop-portal-wlr"

#==========================================================================#
# ZSH
#==========================================================================#
# ZSH Config
if  [ -d "$HOME/.zshrc" ] ; then
    rm $HOME/.zshrc
fi
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# ZSH Theme
if  [ -d "$HOME/.p10k.zsh" ] ; then
    rm $HOME/.p10k.zsh
fi
ln -s $HOME/.dotfiles/.p10k.zsh $HOME/.p10k.zsh

#==========================================================================#
# Temux (Terminal)
#==========================================================================#
if  [ -d "$HOME/.config/tmuxinator" ] ; then
    rm $HOME/.config/tmuxinator
fi
ln -s $HOME/.dotfiles/.config/tmuxinator $HOME/.config/

if  [ -d "$HOME/.tmux.conf" ] ; then
    rm $HOME/.tmux.conf
fi
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
#==========================================================================#
# Sway 
#==========================================================================#
# Sway Loc# Sway Lock
if  [ -d "$HOME/.config/sway" ] ; then
    rm $HOME/.config/sway
fi
ln -s $HOME/.dotfiles/.config/sway $HOME/.config/

# Sway Lock
if  [ -d "$HOME/.config/swaylock" ] ; then
    rm $HOME/.config/swaylock
fi
ln -s $HOME/.dotfiles/.config/swaylock $HOME/.config/

# Waybar
if  [ -d "$HOME/.config/waybar" ] ; then
    rm $HOME/.config/waybar
fi
ln -s $HOME/.dotfiles/.config/waybar $HOME/.config/

#==========================================================================#
# Waybar
#==========================================================================#
if  [ -d "$HOME/.config/xdg-desktop-portal-wlr" ] ; then
    rm $HOME/.config/xdg-desktop-portal-wlr
fi
ln -s $HOME/.dotfiles/.config/xdg-desktop-portal-wlr $HOME/.config/

#==========================================================================#
# Rofi
#==========================================================================#
if  [ -d "$HOME/.config/Rofi" ] ; then
    rm $HOME/.config/rofi
fi
ln -s $HOME/.dotfiles/.config/rofi $HOME/.config/

if ! [ -d "$HOME/.local/share/fonts/FiraCode" ] ; then
    ln -s $HOME/.dotfiles/fonts/FiraCode $HOME/.local/share/fonts
    fc-cache -fv

fi
