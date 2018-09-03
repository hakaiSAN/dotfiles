# Created by newuser for 5.0.2
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "yous/vanilli.sh"
# theme (https://github.com/sindresorhus/pure#zplug)　好みのスキーマをいれてくだされ。
#zplug "mafredri/zsh-async"
#zplug "sindresorhus/pure"
zplug "yous/lime"
# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting"
# history関係
zplug "zsh-users/zsh-history-substring-search"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
# next-generation cd
zplug "b4b4r07/enhancd", use:init.sh
# git plugin add
zplug "plugins/git", from:oh-my-zsh
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load

export ENHANCD_COMMAND=ed
export ENHANCD_FILTER=ENHANCD_FILTER=fzy:fzf:peco

source ~/.zsh_alias
source ~/.zsh_serve

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh_fzf ] && source ~/.zsh_fzf


