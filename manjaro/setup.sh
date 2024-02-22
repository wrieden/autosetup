setupdir=$(dirname $(readlink -f $0))
common=$(dirname $setupdir)/common


ln -sf $common/.p10k.zsh ~/.p10k.zsh
ln -sf $common/.zshrc ~/.zshrc
ln -sf $common/.gitconfig ~/.gitconfig
ln -sf $common/.gitconfig-trinamic ~/.gitconfig-trinamic
ln -sf $common/sshconfig ~/.ssh/config
ln -sf $common/code-settings.json ~/.config/Code\ -\ OSS/User/settings.json
ln -sf $common/code-flags.conf ~/.config/code-flags.conf
ln -sf $common/chromium-flags.conf ~/.config/chromium-flags.conf
