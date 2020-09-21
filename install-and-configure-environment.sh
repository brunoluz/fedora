sudo dnf install xclip -y
sudo dnf install gnome-tweak-tool -y
sudo dnf install vim -y
sudo dnf install chrome-gnome-shell -y
sudo dnf install dnfdragora -y # visual package manager for fedora
sudo dnf install snapd -y
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install code --classic

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

# set cedilha for international keyboard (dead acute + c)
echo "<dead_acute> <C> : \"Ç\" Ccedilla # LATIN CAPITAL LETTER C WITH CEDILLA" >> ~/.XCompose
echo "<dead_acute> <c> : \"ç\" ccedilla # LATIN SMALL LETTER C WITH CEDILLA" >> ~/.XCompose

