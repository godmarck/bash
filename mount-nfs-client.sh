useradd media -u2222

apt install nfs-common htop iotop nethogs net-tools ncdu -y ; mkdir /mnt/ssd

cat << EOF >> /etc/fstab
# mount nfs:
192.168.0.7:/mnt/ssd /mnt/ssd nfs defaults 0 0
EOF

systemctl daemon-reload ; mount -a ; mount
