# create user
sudo useradd -m teazyou
sudo usermod -aG wheel,audio,video,storage,optical teazyou

# date settings
sudo ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
sudo timedatectl set-ntp true
sudo hwclock --systohc

# hostname
sudo rm -rf /etc/hostname
sudo echo "archteazyou" >> /etc/hostname
sudo rm -rf /etc/hosts
sudo cp /home/teazyou/workspace_archlinux/configs/others/hosts_fresh_install /etc/hosts

# language
sudo echo en_US.UTF-8 UTF-8 > /etc/locale.gen
sudo locale-gen

# mkdir folders
mkdir /home/teazyou/srcpkgs
mkdir /home/teazyou/dev

# base package
sudo pacman -S base-devel git curl vim sudo pass xdg-utils tig iwd netc1tl networkmanager grub efibootmgr intel-ucode alsa alsa-plugins alsa-utils htop neofetch man-db man-pages texinfo dhcpcd zsh

# git config
sudo cp /home/teazyou/workspace_archlinux/configs/git/gitconfig /home/teazyou/.gitconfig

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh
cp /home/teazyou/workspace_archlinux/configs/zshrc/zshrc_replacer /home/teazyou/.zshrc
source /home/teazyou/.zshrc

#yay yet another yaourt
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R teazyou:teazyou ./yay-git
cd yay-git
makepkg -si
sudo yay -Syu
yay --save --answerdiff None --answerclean None --removemake

# yay packages
yay -S franz code spotify firefox google-chrome

# git credential manager ( and pass config )
yay -S git-credential-manager-core-bin
git config --global credential.helper manager-core
export GCM_CREDENTIAL_STORE=gpg2
pass init teazyou-store

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