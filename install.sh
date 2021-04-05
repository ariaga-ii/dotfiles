dotfiles_dir=~/dotfiles

ln -sf $dotfiles_dir/.zshrc ~/.zshrc

vim_config_dir=~/.config/nvim
ln -sf $dotfiles_dir/nvim/init.vim $vim_config_dir/init.vim
ln -sf $dotfiles_dir/nvim/coc.vim $vim_config_dir/plugged/coc.nvim/autoload/coc.vim
ln -sf $dotfiles_dir/nvim/coc-settings.json $vim_config_dir/coc-settings.json

ranger_config_dir=~/.config/ranger
ln -sf $dotfiles_dir/ranger/rc.conf $ranger_config_dir/rc.conf
ln -sf $dotfiles_dir/ranger/rifle.conf $ranger_config_dir/rifle.conf
ln -sf $dotfiles_dir/ranger/scope.sh $ranger_config_dir/scope.sh
