ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zsh_alias ~/.zsh_alias
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.dein.toml ~/.dein.toml
ln -sf ~/dotfiles/.dein_lazy.toml ~/.dein_lazy.toml

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
