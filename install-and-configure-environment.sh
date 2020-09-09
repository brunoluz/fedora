sudo dnf install xclip -y
sudo dnf install gnome-tweak-tool -y
sudo dnf install vim -y
sudo dnf install chrome-gnome-shell -y

# nautilus - add "New Document" or right click
touch ~/Templates/Empty\ Document

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && sudo dnf localinstall google-chrome-stable_current_x86_64.rpm -y && rm -f google-chrome-stable_current_x86_64.rpm*

# tap to click
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true