pacman -S base-devel git vim sudo iwd netctl networkmanager grub efibootmgr intel-ucode alsa alsa-plugins alsa-utils htop neofetch man-db man-pages texinfo dhcpcd
sudo systemctl enable --now iwd
sudo systemctl enable --now dhcpcd
sudo cp ~/workspace_archlinux/services/iwd.service /usr/lib/systemd/system/iwd.service
sudo cp ~/workspace_archlinux/services/getty@.service /usr/lib/systemd/system/getty@.service
echo "Done!"
echo "-> Need to uncomment group wheel with visudo command"
echo "-> edit /etc/default/grub, set GRUB_TIMEOUT=0, rebuild grub config (alias: updgrub)"
echo "-> added 3sc delay to iwd service at start (prevent start while wifi card not ready)"
echo "-> added getty file to skip login on computer start"