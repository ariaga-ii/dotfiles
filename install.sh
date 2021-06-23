dotfiles_dir=~/dotfiles
ln -sf $dotfiles_dir/.zshrc ~/.zshrc

config_dir=~/.config

# nvim stuff
ln -sf $dotfiles_dir/nvim/init.vim $config_dir/nvim/init.vim
rm -rf $config_dir/nvim/plugin
mkdir -p $config_dir/nvim/plugin
for f in `find nvim/plugin -maxdepth 1 -type f -name "*.vim"`; do
  rm -rf $config_dir/$f
  ln -s $dotfiles_dir/$f $config_dir/$f
done
ln -sf $dotfiles_dir/nvim/autoload/coc.vim $config_dir/nvim/plugged/coc.nvim/autoload/coc.vim
ln -sf $dotfiles_dir/nvim/coc-settings.json $config_dir/nvim/coc-settings.json
ln -sf $dotfiles_dir/nvim/ftplugin $config_dir/nvim/ftplugin


# ranger
ranger_config_dir=~/.config/ranger
ln -sf $dotfiles_dir/ranger/rc.conf $ranger_config_dir/rc.conf
ln -sf $dotfiles_dir/ranger/rifle.conf $ranger_config_dir/rifle.conf
ln -sf $dotfiles_dir/ranger/scope.sh $ranger_config_dir/scope.sh

#bat
mkdir -p $config_dir/bat
ln -sf $dotfiles_dir/bat/config $config_dir/bat/config
