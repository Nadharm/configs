# For the inevitable day where I nuke my devbox for no good reason again

# Helper I stole from stack overflow
add_ppa() {
  grep -h "$1" /etc/apt/sources.list.d/* > /dev/null 2>&1
  if [ $? -ne 0 ]
  then
    echo "Adding ppa:$1"
    sudo add-apt-repository -y ppa:$1
    return 0
  fi

  echo "ppa:$1 already exists"
  return 1
}

# Regular initial upgrade
sudo apt update && sudo apt upgrade

# VMWare display stuff
add_ppa oibaf/graphics-drivers
sudo apt update && sudo apt upgrade -y

sudo apt install open-vm-tools open-vm-tools-desktop -y

# Normal stuff
sudo apt install -y \
	git \
	vim \
	htop \
	tmux \
	curl \

# Install neovim stuff
# add_ppa neovim-ppa/stable
# sudo apt-get update
# sudo apt-get install neovim -y
sudo snap install nvim --classic

# Install packages needed by neovim
sudo apt-get install -y \
  npm \
  ripgrep \
  fzf \

# Nerd font installation helper
install_nerdfont() {
  version='3.3.0'
  fonts_dir="${HOME}/.local/share/fonts"
  font="$1"

  if [ $(find ${fonts_dir} -name ${font}*  | wc -l) -gt 0 ]; then
	  echo "Font ${font} already installed..."
	  return 0
  fi
  zip_file="${font}.zip"
  download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
  echo "Downloading $download_url"
  wget "$download_url"
  unzip "$zip_file" -d "$fonts_dir"
  rm "$zip_file"

  find "$fonts_dir" -name '*Windows Compatible*' -delete

  fc-cache -fv
}

install_nerdfont FiraMono

# Rose-pine terminal setup
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal/rose-pine.dconf

# Copy nvim stuff over
rm -rf ~/.config/nvim
cp -r ./nvim ~/.config/nvim

# Install TPM
if [[ ! -e ~/.tmux/plugins/tpm ]]; then 
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Copy tmux conf
cp ./tmux/tmux.conf ~/.tmux.conf

# Git
git config --global core.editor "nvim"

# Attempt to disable Super + N behavior and replace with window stuff
for i in $(seq 1 9); do
  gsettings set org.gnome.shell.keybindings switch-to-application-$i  []
  gsettings set org.gnome.shell.keybindings open-new-window-application-$i  []
done

gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>1']"
