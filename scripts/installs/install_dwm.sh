sudo pacman -S base-devel git xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk

mkdir -p /home/teazyou/srcpkgs

cd /home/teazyou/srcpkgs
if [ ! -d /home/teazyou/srcpkgs/st ]; then
   git clone https://git.suckless.org/st
   sudo chown -R teazyou:teazyou ./st
fi

cd /home/teazyou/srcpkgs/st
git pull
sudo make clean install

cd /home/teazyou/srcpkgs
if [ ! -d /home/teazyou/srcpkgs/dwm_fork ]; then
   git clone https://github.com/michaellinhardt/dwm_fork.git
   sudo chown -R teazyou:teazyou ./dwm_fork
fi

cd /home/teazyou/srcpkgs/dwm_fork
git pull
sudo make clean install

cd ~
if [ ! -d /home/teazyou/.xinitrc ]; then
   mv /home/teazyou/.xinitrc ~.xinitrc_old
fi
echo "exec dwm" > /home/teazyou/.xinitrc

mkdir -p /home/teazyou/.dwm
sudo rm -rf /home/teazyou/.dwm/autostart.sh
sudo rm -rf /home/teazyou/.dwm/autostart_blocking.sh
sudo echo "/bin/bash /home/teazyou/workspace_archlinux/scripts/dwm/dwm_autostart.sh" > /home/teazyou/.dwm/autostart.sh
sudo echo "/bin/bash /home/teazyou/workspace_archlinux/scripts/dwm/dwm_autostart_blocking.sh" > /home/teazyou/.dwm/autostart_blocking.sh
sudo chmod +x /home/teazyou/.dwm/autostart.sh
sudo chmod +x /home/teazyou/.dwm/autostart_blocking.sh

echo "Done! type startx to run or add startx to .bash_profile"
