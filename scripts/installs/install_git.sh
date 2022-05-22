sudo pacman -S git curl pass

# git config
sudo cp /home/teazyou/workspace_archlinux/configs/git/gitconfig /home/teazyou/.gitconfig

# git credential manager
yay -S git-credential-manager-core-bin
git config --global credential.helper manager-core
export GCM_CREDENTIAL_STORE=gpg2
pass init teazyou-store