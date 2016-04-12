ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# Mac用
if [ "$ (uname)" == 'Darwin' ]; then
ln -sf ~/dotfiles/bin/get_ssid /usr/local/bin/get_ssid
ln -sf ~/dotfiles/bin/battery /usr/local/bin/battery
fi

#arch linux用
if [[ `uname -r` =~ ARCH$ ]]; then
     # echo "matched Arch Linux."
     ln -sf ~/dotfiles/.xmonad/xmonad.hs ~/.xmonad/xmonad.hs
fi
