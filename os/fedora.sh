sudo dnf update -y
sudo dnf upgrade -y

sudo dnf install webkit2gtk4.0-devel \
   openssl-devel \
   curl \
   wget \
   file \
   libappindicator-gtk3-devel \
   librsvg2-devel -y
sudo dnf group install "C Development Tools and Libraries" -y


#Install Rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y

# Zig
sudo dnf install zig -y

# GNOMES

## minimize/maximize
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

## Dark theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

## hot corner
gsettings set org.gnome.desktop.interface enable-hot-corners false


# NEOVIM
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim

# my configs
git clone https://github.com/SParente/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim


# Flatpak

sudo flatpak install flathub io.dbeaver.DBeaverCommunity -y
sudo flatpak install flathub com.spotify.Client -y
sudo flatpak install flathub org.gimp.GIMP -y
sudo flatpak install flathub org.freecadweb.FreeCAD -y
sudo flatpak install flathub io.github.mimbrero.WhatsAppDesktop -y
sudo flatpak install flathub org.videolan.VLC -y
sudo flatpak install flathub org.keepassxc.KeePassXC -y

# Install software

sudo dnf install docker -y
sudo dnf install tmux -y
sudo dnf install gh -y
sudo dnf install golang -y
# Tmux config
echo "set -g base-index 1" > ~/.tmux.conf


# configs
export PATH=$PATH:~/go/bin
export PATH=$PATH:/usr/local/go/bin
