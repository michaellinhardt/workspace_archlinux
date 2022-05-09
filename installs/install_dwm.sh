sudo pacman -S base-devel git xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk

mkdir -p ~/srcpkgs

cd ~/srcpkgs
if [ ! -d ~/srcpkgs/st ]; then
   git clone git clone https://git.suckless.org/st
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

echo "Done! type startx to run or add startx to .bash_profile"