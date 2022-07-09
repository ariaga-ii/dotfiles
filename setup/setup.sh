CONFIG_HOME=$HOME/.config
prompt() {
  local ans=""
  printf '%s (y/n) ' $1
  read ans
  if [ "$ans" = "y" ]; then
      eval "$2"
  fi
}

# apple dev tools
__xcode() {
  echo "installing xcode tools..."
  xcode-select --install;
}

__configure_ssh() {
  echo "configuring ssh..."
  ssh-keygen -t ed25519 -C $1
  eval "$(ssh-agent -s)"
  touch ~/.ssh/config
  echo "Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config
  ssh-add -K ~/.ssh/id_ed25519
  pbcopy < ~/.ssh/id_ed25519.pub
  echo "ssh public key copied to clipboard, please enter it at https://github.com/settings/ssh/new"
}

__git() {
  echo "configuring git..."

  local git_user=""
  printf '%s' "please enter github username: " 
  read git_user

  local git_email=""
  printf '%s' "please enter github email: " 
  read git_email 

  __configure_ssh $git_email
  git config --global user.name=$git_user
  git config --global user.email=$git_email
}

__dotfiles() {
  git clone --recurse-submodules --remote-submodules git@github.com:crawdaddie/dotfiles.git $CONFIG_HOME
}

# brew
__brew() {
  echo "installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "installing packages from brewfile"
  brew bundle --file=$CONFIG_HOME/Brewfile
}

# oh-my-zsh
__shell() {
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ln -s $CONFIG_HOME/shell/.zshrc ~/.zshrc
  ln -s $CONFIG_HOME/shell/.p10k.zsh ~/.p10k.zsh
  $(brew --prefix)/opt/fzf/install
}

__python() {
  pyenv init
  pyenv install anaconda3-5.3.1
  pyenv global anaconda3-5.3.1
  pip install ptpython
  ln -s $CONFIG_HOME/ptpython $HOME/Library/Application\ Support/
}

prompt "install xcode tools?" "__xcode";
prompt "configure git?" "__git";
prompt "configure dotfiles?" "__dotfiles";
prompt "configure brew?" "__brew";
prompt "configure shell?" "__shell";
prompt "configure python?" "__python";
