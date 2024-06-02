echo "wlans_iwlwifi0=\"wlan0\"" >> /etc/rc.conf
echo "ifconfig_wlan0=\"WPA SYNCDHCP\"" >> /etc/rc.conf
echo "kld_list=\"i915kms\"" >> /etc/rc.conf
echo "ntpdate_enable=\"YES\"" >> /etc/rc.conf

cp /mnt/setup/configs/wpa_supplicant.conf /etc/
service netif restart

sh /mnt/setup/configs/install.sh

echo "autoboot_delay=0" >> /boot/loader.conf
echo "loader_logo=\"beastie\"" >> /boot/loader.conf

ln -s "$(which startx)" /usr/local/bin/x

cp /mnt/setup/configs/doas.conf /usr/local/etc/
cp /mnt/setup/configs/.cwmrc /home/rookie/
cp /mnt/setup/configs/.xinitrc /home/rookie/
cp /mnt/setup/configs/.permissions.sh /home/rookie/
cp /mnt/setup/configs/.img.jpg /home/rookie/
cp /mnt/setup/configs/.lemonbar.sh /home/rookie/
cp /mnt/setup/configs/.xbindkeysrc /home/rookie/
rm -rf /home/rookie/.vim/ /home/rookie/.vimrc /home/rookie/.viminfo
cp /mnt/setup/configs/.vimrc /home/rookie/

mkdir -p /home/rookie/.config/alacritty
cp /mnt/setup/configs/alacritty.toml /home/rookie/.config/alacritty

mkdir -p /home/rookie/.config/fish/functions
cp /mnt/setup/configs/fish_greeting.fish /home/rookie/.config/fish/functions

chsh -s /usr/local/bin/fish rookie

sh /home/rookie/.permissions.sh
