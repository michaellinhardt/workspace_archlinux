# create user
sudo usermod -aG wheel,audio,video,storage,optical teazyou

# mkdir folders
mkdir /home/teazyou/srcpkgs
mkdir /home/teazyou/dev

# base package
sudo pacman -S base-devel git curl vim sudo pass xdg-utils tig iwd netctl networkmanager grub efibootmgr intel-ucode alsa alsa-plugins alsa-utils htop neofetch man-db man-pages texinfo dhcpcd zsh python ruby npm java-runtime-common java-environment-common mysql rclone

# git config
sudo cp /home/teazyou/workspace_archlinux/configs/git/gitconfig /home/teazyou/.gitconfig

#yay yet another yaourt
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R teazyou:teazyou ./yay-git
cd yay-git
makepkg -si
sudo yay -Syu
yay --save --answerdiff None --answerclean None --removemake

# yay packages
yay -S franz code spotify firefox google-chrome nvm watchman zoom postman nordvpn bitwarden

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

# oh-my-zsh
cp /home/teazyou/workspace_archlinux/configs/zshrc/zshrc_replacer /home/teazyou/.zshrc
if [ ! -d /home/teazyou/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Done!"
echo "-> Need to uncomment group wheel with visudo command"
echo "-> edit /etc/default/grub, set GRUB_TIMEOUT=0, rebuild grub config (alias: updgrub)"
echo "-> added 3sc delay to iwd service at start (prevent start while wifi card not ready)"
echo "-> added getty file to skip login on computer start"

zsh
source /home/teazyou/.zshrc