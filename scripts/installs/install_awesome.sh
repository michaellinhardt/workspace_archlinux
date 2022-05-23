sudo pacman -S xorg-server xorg-xinit xterm awesome rofi papirus-icon-theme
yay -S pamixer librewolf mpc mpd scrot unclutter xsel slock ttf-roboto i3lock xclip materia-theme lxappearance xorg-xbacklight xfce4-power-manager glib lain-git
cd /home/teazyou/srcpkgs
git clone --depth 1 --recursive https://github.com/lcpz/awesome-copycats.git
mv -bv awesome-copycats/* /home/teazyou/.config/awesome && rm-rf awesome-copycats
mkdir -p /home/teazyou/.config/awesome/
sudo cp $PATH_WORKSPACE/configs/xinitrc/xinitrc_awesome /home/teazyou/.xinitrc
sudo cp $PATH_WORKSPACE/configs/awesome/rc_replacer.lua /home/teazyou/.config/awesome/rc.lua
mkdir -p /home/teazyou/.config/rofi/
sudo cp $PATH_WORKSPACE/configs/awesome/rofi/config.rasi /home/teazyou/.config/rofi/config.rasi
