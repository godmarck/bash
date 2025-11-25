# ~/.bashrc – bootstrap only
case $- in *i*) ;; *) return;; esac

DOTFILES="$HOME/.dotfiles"

# Auto-update dotfiles from GitHub (quiet background pull)
[ -d "$DOTFILES" ] && (cd "$DOTFILES" && git pull --quiet --rebase &>/dev/null &)

# Source the real config
[ -f "$DOTFILES/bash-common.sh" ] && source "$DOTFILES/bash-common.sh"
