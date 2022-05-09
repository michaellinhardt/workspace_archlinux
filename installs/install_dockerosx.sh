sudo pacman -S docker qemu libvirt dnsmasq virt-manager bridge-utils flex bison iptables-nft edk2-ovmf webkit2gtk xorg-xhost
sudo systemctl enable --now libvirtd
sudo systemctl enable --now virtlogd
echo 1 | sudo tee /sys/module/kvm/parameters/ignore_msrs
sudo modprobe kvm
sudo systemctl --enable --now docker
sudo usermod -aG docker,libvirt,kvm "${USER}"