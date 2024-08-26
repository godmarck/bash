apt install nfs-common htop ncdu net-tools -y

cat << EOF >> ~/.bashrc
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -ltr'
alias l='ls $LS_OPTIONS -lA'
EOF

. ~/.bashrc
