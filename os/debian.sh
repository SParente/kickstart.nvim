# NOTE: CHECK ZIG LINK if is up to date


sudo apt update -y
sudo apt upgrade -y

sudo apt install libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    file \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev -y

#make bin
mkdir ~/bin

#Install Rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y

# Zig
mkdir ~/bin/zig
sudo curl https://ziglang.org/builds/zig-linux-x86_64-0.14.0-dev.1860+2e2927735.tar.xz -o zig.tar.xz
tar -xf ./zig.tar.xz
mv ./zig-linux-x86_64-0.14.0-dev.1860+2e2927735/* ~/bin/zig
sudo rm zig-linux-x86_64-0.14.0-dev.1860+2e2927735/ -R
sudo rm zig.tar.xz 
echo "export PATH=$PATH:~/bin/zig" >> .bashrc

# GNOMES

## minimize/maximize
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

## Dark theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

## hot corner
gsettings set org.gnome.desktop.interface enable-hot-corners false

##scroll direction
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

##calendar week number
gsettings set org.gnome.desktop.calendar show-weekdate true


# NEOVIM
sudo apt install -y gcc make git ripgrep fd-find unzip

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

echo "export PATH=$PATH:/opt/nvim-linux64/bin" >> .bashrc

# my configs
git clone https://github.com/SParente/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim


# Flatpak

flatpak install flathub io.dbeaver.DBeaverCommunity -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.freecadweb.FreeCAD -y
flatpak install flathub io.github.mimbrero.WhatsAppDesktop -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub org.keepassxc.KeePassXC -y

# DOCKER
# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update


sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER

sudo sh -eux <<EOF
# Install newuidmap & newgidmap binaries
apt-get install -y uidmap
EOF


sh /bin/dockerd-rootless-setuptool.sh install



# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install software

sudo apt install tmux -y
sudo apt install gh -y
sudo apt install golang -y
# Tmux config
echo "set -g base-index 1" > ~/.tmux.conf


# Configs
echo "export PATH=$PATH:~/go/bin" >> .bashcrc
echo "PATH=$PATH:/usr/local/go/bin" >> .bashrc

#Lazygit
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit -y

# Nerd Fonts
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv

# NVIM
## installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

## download and install Node.js (you may need to restart the terminal)
nvm install 20

## verifies the right Node.js version is in the environment
node -v # should print `v20.18.0`

cd ~
