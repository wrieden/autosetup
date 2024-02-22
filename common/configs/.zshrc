[[ ! -v WSL_DISTRO_NAME ]] || usbip list --remote=$(ip route show 0.0.0.0/0 | cut -d\  -f3)  | sed -rn 's/^\s*([0-9]+-[0-9]+).*/\1/p' | xargs -rn1 sudo usbip attach --remote=$(ip route show 0.0.0.0/0 | cut -d\  -f3) -b
[[ ! -f ~/.python-venv/bin/activate ]] || source ~/.python-venv/bin/activate

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f $ZSH/oh-my-zsh.sh ]] || source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
