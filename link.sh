ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zsh_alias ~/.zsh_alias
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.dein.toml ~/.dein.toml
ln -sf ~/dotfiles/.dein_lazy.toml ~/.dein_lazy.toml
ln -sf ~/dotfiles/.zsh_fzf ~/.zsh_fzf

#Ubuntu用
if [ -f /etc/lsb-release ]; then
  echo "Debian Match. Probably Ubuntu"
  sudo apt-get install xsel
fi

# Mac用
if [ "$ (uname)" == 'Darwin' ]; then
  echo "OS match Mac OSX."
  ln -sf ~/dotfiles/bin/get_ssid /usr/local/bin/get_ssid
  ln -sf ~/dotfiles/bin/battery /usr/local/bin/battery
fi

#arch linux用
if [[ `uname -r` =~ ARCH$ ]]; then
  echo "OS match Arch Linux."
  ln -sf ~/dotfiles/.xmonad/xmonad.hs ~/.xmonad/xmonad.hs
fi

#install dein.vim
mkdir -p ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/.cache/dein_installer.sh
sh ~/.cache/dein_installer.sh ~/.cache/dein

#install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

if [[ `cat /etc/lsb-release` =~ "Ubuntu" ]]; then
  sudo apt-get install xsel
fi
if [[ `cat /etc/redhat-release` =~ "CentOS" ]]; then
  sudo yum install zsh tmux vim xsel
  cd ~/.cache/dein/repos/github.com/Shougo/dein.vim 
  git checkout 1.5
fi



