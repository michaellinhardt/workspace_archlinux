sudo pacman -S base-devel git xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk

mkdir -p ~/srcpkgs

cd ~/srcpkgs
if [ ! -d ~/srcpkgs/st ]; then
   git clone https://git.suckless.org/st
fi

cd ~/srcpkgs/st
git pull
sudo make clean install

cd ~/srcpkgs
if [ ! -d ~/srcpkgs/dwm_fork ]; then
   git clone https://github.com/michaellinhardt/dwm_fork.git
fi

cd ~/srcpkgs/dwm_fork
git pull
sudo make clean install

cd ~
if [ ! -d ~/.xinitrc ]; then
   mv ~/.xinitrc ~.xinitrc_old
fi
echo "exec dwm" > ~/.xinitrc

mkdir -p ~/.dwm
sudo rm -rf ~/.dwm/autostart.sh
sudo rm -rf ~/.dwm/autostart_blocking.sh
sudo echo "/bin/bash ~/workspace_archlinux/scripts/dwm/dwm_autostart.sh" > ~/.dwm/autostart.sh
sudo echo "/bin/bash ~/workspace_archlinux/scripts/dwm/dwm_autostart_blocking.sh" > ~/.dwm/autostart_blocking.sh
sudo chmod +x ~/.dwm/autostart.sh
sudo chmod +x ~/.dwm/autostart_blocking.sh

echo "Done! type startx to run or add startx to .bash_profile"
