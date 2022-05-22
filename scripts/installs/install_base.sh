# create user
sudo useradd -m teazyou
sudo usermod -aG wheel,audio,video,storage,optical teazyou

# date settings
sudo ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
sudo timedatectl set-ntp true
sudo hwclock --systohc

# language
sudo echo en_US.UTF-8 UTF-8 > /etc/locale.gen
sudo locale-gen

# src folder
mkdir /home/teazyou/srcpkgs

# base package
sudo pacman -S base-devel git curl vim sudo iwd netc1tl networkmanager grub efibootmgr intel-ucode alsa alsa-plugins alsa-utils htop neofetch man-db man-pages texinfo dhcpcd zsh

# git config
sudo cp /home/teazyou/workspace_archlinux/configs/git/gitconfig /home/teazyou/.gitconfig

# oh-my-zsh

#yay yet another yaourt
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R teazyou:teazyou ./yay-git
cd yay-git
makepkg -si
sudo yay -Syu
yay --save --answerdiff None

# network services
sudo systemctl enable --now iwd
sudo systemctl enable --now dhcpcd

# erase service iwd (add delay at startup)
sudo cp /home/teazyou/workspace_archlinux/configs/services/iwd.service /usr/lib/systemd/system/iwd.service

# service to auto login when reboot
sudo cp /home/teazyou/workspace_archlinux/configs/services/getty@.service /usr/lib/systemd/system/getty@.service

echo "Done!"
echo "-> Need to uncomment group wheel with visudo command"
echo "-> edit /etc/default/grub, set GRUB_TIMEOUT=0, rebuild grub config (alias: updgrub)"
echo "-> added 3sc delay to iwd service at start (prevent start while wifi card not ready)"
echo "-> added getty file to skip login on computer start"