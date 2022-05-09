pacman -S base-devel git vim sudo iwd netctl networkmanager grub efibootmgr intel-ucode alsa alsa-plugins alsa-utils htop neofetch man-db man-pages texinfo dhcpcd
sudo systemctl enable --now iwd
sudo systemctl enable --now dhcpcd
echo "Done!"
echo "-> Need to uncomment group wheel with visudo command"
echo "-> edit /etc/default/grub, set GRUB_TIMEOUT=0, rebuild grub config (alias: updgrub)"