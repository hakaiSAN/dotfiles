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
  #NOTE: Not have a compatiablity for BigSur
  ln -sf ~/dotfiles/bin/get_ssid /usr/local/bin/get_ssid
  ln -sf ~/dotfiles/bin/battery /usr/local/bin/battery
  ln -sf ~/dotfiles/bin/ssh-pane /usr/local/bin/ssh-pane
  ln -sf ~/dotfiles/.yabairc ~/.yabairc
  ln -sf ~/dotfiles/.skhdrc ~/.skhdrc
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
touch ~/.zsh_serve

if [[ `cat /etc/lsb-release` =~ "Ubuntu" ]]; then
  sudo apt-get install xsel git zsh vim tmux
fi
if [[ `cat /etc/redhat-release` =~ "CentOS" ]]; then
  sudo yum install git zsh tmux vim xsel
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 
  ~/.fzf/install
  cd ~/.cache/dein/repos/github.com/Shougo/dein.vim 
  git checkout 1.5
fi



