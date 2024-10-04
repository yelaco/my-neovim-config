#!/bin/bash

# install/update neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo rm nvim-linux64.tar.gz

# neovim appimage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

sudo apt-get install ripgrep

# setup font
sudo cp .font/*.ttf /usr/share/fonts/truetype/
sudo fc-cache -f -v

# setup vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc

# install sqlfluff
brew install sqlfluff

# flutter dependencies
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev

# tmux
sudo apt install tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp ~/.config/nvim/.others/.tmux.conf.local .

# bash-profile
echo 'source ~/.bashrc' >> ~/.bash_profile

# shell
cp -r ~/.config/nvim/.others/neofetch ~/.config/
cp -r ~/.config/nvim/.others/synth-shell ~/.config/

# gtk theme
cd ~/.config/nvim
git clone https://github.com/dracula/gtk Dracula
cp -r Dracula/assets ~/.config
mkdir ~/.config/gtk-4.0
cp Dracula/gtk-4.0/gtk.css ~/.config/gtk-4.0
cp Dracula/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0
sudo mv Dracula /usr/share/themes/
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
mkdir -p ~/.icons/Dracula
sudo unzip Dracula.zip -d ~/.icons
gsettings set org.gnome.desktop.interface icon-theme "Dracula"
sudo rm Dracula.zip
