sudo dnf install xclip -y
sudo dnf install gnome-tweak-tool -y
sudo dnf install vim -y
sudo dnf install chrome-gnome-shell -y
sudo dnf install dnfdragora -y # visual package manager for fedora
sudo dnf install snapd -y
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install code --classic
sudo snap install snap-store

# rpm fusion free repository
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
# rpm fusion non-free repository
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# spotify (must open spotify from application lpf-spotify-client after)
sudo dnf install lpf-spotify-client -y

# nautilus - add "New Document" or right click
touch ~/Templates/Empty\ Document

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf localinstall google-chrome-stable_current_x86_64.rpm -y
rm -f google-chrome-stable_current_x86_64.rpm*

# tap to click
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# install cascadia code font
wget https://github.com/microsoft/cascadia-code/releases/download/v2009.14/CascadiaCode-2009.14.zip && \
sudo mkdir -p /usr/share/fonts/truetype && \
sudo unzip CascadiaCode-2009.14.zip -d /usr/share/fonts/truetype && \
rm -f CascadiaCode-2009.14.zip*

# set desktop as solid color
gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background primary-color 'rgb(66, 81, 100)'

# custom path
mkdir ~/.custom_path
echo "CUSTOM_PATH=$( getent passwd $USER | cut -d: -f6 )/.custom_path
if [[ ! \$PATH == *\"\$CUSTOM_PATH\"* ]]; then
   PATH=\"\$PATH:\$CUSTOM_PATH\"
fi
export PATH" >> ~/.bashrc

ln -s "$(which google-chrome)" ~/.custom_path/chrome
ln -s "$(which gnome-session-quit)" ~/.custom_path/logoff

# set cedilha for international keyboard (dead acute + c)
echo "<dead_acute> <C> : \"Ç\" Ccedilla # LATIN CAPITAL LETTER C WITH CEDILLA" >> ~/.XCompose
echo "<dead_acute> <c> : \"ç\" ccedilla # LATIN SMALL LETTER C WITH CEDILLA" >> ~/.XCompose

# codecs (firefox and opera use them to play some streams)
sudo dnf install ffmpeg-libs compat-ffmpeg28 -y

# extra mouse buttons to control volume
sudo dnf install xbindkeys xdotool -y
xbindkeys -d > ~/.xbindkeysrc
echo "
# Adjust volume with mouse buttons
\"xdotool key XF86AudioLowerVolume\"
    b:8
\"xdotool key XF86AudioRaiseVolume\"
    b:9
" >> ~/.xbindkeysrc
echo "xbindkeys" >> ~/.profile

# open with code (https://github.com/harry-cpp/code-nautilus)
wget -qO- https://raw.githubusercontent.com/cra0zy/code-nautilus/master/install.sh | bash

# backspace shortcut for nautilus (https://github.com/7aman/backspace-up)
wget -qO- https://raw.githubusercontent.com/7aman/backspace-up/master/install.sh | bash
