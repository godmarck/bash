apt install nfs-common htop ncdu net-tools nmap -y

cat << EOF >> ~/.bashrc
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -ltr'
alias l='ls $LS_OPTIONS -lA'
# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
EOF

sed -i -e 's/^#PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
systemctl restart ssh
