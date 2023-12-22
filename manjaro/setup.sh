setupdir=$(dirname $(readlink -f $0))

ln -sf $setupdir/.p10k.zsh ~/.p10k.zsh
ln -sf $setupdir/.zshrc ~/.zshrc
ln -sf $setupdir/.gitconfig ~/.gitconfig
ln -sf $setupdir/.gitconfig-trinamic ~/.gitconfig-trinamic
ln -sf $setupdir/sshconfig ~/.ssh/config
ln -sf $setupdir/code-settings.json ~/.config/Code\ -\ OSS/User/settings.js
ln -sf $setupdir/code-flags.conf ~/.config/code-flags.conf
ln -sf $setupdir/chromium-flags.conf ~/.config/chromium-flags.conf
