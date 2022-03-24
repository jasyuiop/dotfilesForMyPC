# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/jasyuiop/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Plugins
plugins=(git extract sudo systemadmin tmux docker npm yarn zsh-autosuggestions zsh-syntax-highlighting colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='vim'
export TERM=xterm-256color
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"

# Keychain
eval $(keychain --eval --quiet id_ed25519 ~/.ssh/id_ed25519)

# Tmux Sessions
alias mySession='tmux new-session -d -s "My Session"'
alias workSession='tmux new-session -d -s "Work Session"'
alias sourcetmux='tmux source ~/.tmux.conf'

# Disk aliases
alias torrents='cd /media/HDD1/Torrents'
alias hdd1='cd /media/HDD1/'
alias enc01='cd /media/VeraCrypt/EncryptedVolume01'

# Upgrade,Clean....
alias uoc='~/updateAndClean.sh'

# git config
alias dotfiles='/usr/bin/git --git-dir=/home/jasyuiop/.cfg/ --work-tree=/home/jasyuiop'

# feh alias
alias fehSlideshow2sec='feh --hide-pointer -qrZFD 2.0 .'
alias fehSlideshow='feh --hide-pointer -qrZF .'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
