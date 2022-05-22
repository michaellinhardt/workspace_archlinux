sudo pacman -S xorg-server xorg-xinit xterm awesome
mkdir -p ~/.config/awesome/
cp $PATH_WORKSPACE/configs/xinitrc/xinitrc_awesome /home/teazyou/.xinitrc
cp /home/teazyou/workspace_archlinux/configs/awesome/rc_replacer.lua /home/teazyou/.config/awesome/rc.lua
