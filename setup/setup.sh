CONFIG_HOME=$HOME/.config2
# apple dev tools
__xcode() {
  read install_xcode"?install xcode tools? (y/n) "
  if [ "$install_xcode" = "y" ]; then
    echo "installing xcode tools..."
    xcode-select --install;
  fi
}

__configure_ssh() {
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
  read configure_git"?configure git? (y/n) "
  if [ "$configure_git" = "y" ]; then
    read git_user"?please enter github username: "
    read git_email"?please enter email: "
    __configure_ssh $git_email
    git config --global user.name=$git_user
    git config --global user.email=$git_email
  fi
}

__dotfiles() {
  read fetch_dotfiles"?fetch full config? (y/n) "
  if [ "$fetch_dotfiles" = "y" ]; then
    git clone git@github.com:crawdaddie/dotfiles.git $CONFIG_HOME
  fi
}

# brew
__brew() {
  read install_brew"?install brew? (y/n) " 
  if [ "$install_brew" = "y" ]; then
    echo "installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "installing packages from brewfile"
    brew bundle --file=$CONFIG_HOME/Brewfile

  fi
}

# oh-my-zsh
__shell() {
  read configure_ohmyzsh"?configure oh-my-zsh? "
  if [ "$configure_ohmyzsh" = "y" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ln -s $CONFIG_HOME/shell/.zshrc ~/.zshrc
    ln -s $CONFIG_HOME/shell/.p10k.zsh ~/.p10k.zsh
    $(brew --prefix)/opt/fzf/install
  fi
}

__python() {
  read configure_python"?install python? "
  if [ "$configure_python" = "y" ]; then
    pyenv init
    pyenv install anaconda3-5.3.1
    pyenv global anaconda3-5.3.1
    pip install ptpython
    ln -s $CONFIG_HOME/ptpython $HOME/Library/Application\ Support/
  fi
}

__xcode
__git
__dotfiles
__brew
__shell
__python
