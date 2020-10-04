sudo dnf install xclip -y
sudo dnf install gnome-tweak-tool -y
sudo dnf install vim -y
sudo dnf install chrome-gnome-shell -y
sudo dnf install dnfdragora -y # visual package manager for fedora
sudo dnf install snapd -y
sudo dnf install gparted -y
sudo snap install snap-store

# change hostname
hostnamectl set-hostname {hostname}

# configure ssh
ssh-keygen -t rsa -b 4096 -C {email}
eval "$(ssh-agent -s)"
xclip -sel clip < ~/.ssh/id_rsa.pub

# configure git
git config --global user.email {email}
git config --global user.name {name}

# vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code

# rpm fusion free repository
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
# rpm fusion non-free repository
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

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
rm -f CascadiaCode-2009.14.zip*rc

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

# open with code 
wget -qO- https://raw.githubusercontent.com/brunoluz/code-nautilus/master/install.sh | bash

# backspace shortcut for nautilus (https://github.com/7aman/backspace-up)
wget -qO- https://raw.githubusercontent.com/7aman/backspace-up/master/install.sh | bash

# imwheel 
sudo dnf install imwheel -y
echo "\".*\"
None,      Up,   Button4, 2
None,      Down, Button5, 2
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5" >> ~/.imwheelrc
echo "imwheel" >> ~/.profile

# mcdir command
cat << EOF >> ~/.bashrc 

# mkdir and cd
mcdir ()
{
  mkdir -p -- "\$1" &&
  cd -P -- "\$1"
}
EOF

# PS1=[\u@\h \W]\$ (old PS1)
# colored PS1
cat << EOF >> ~/.bashrc
FGBLK=\$( tput setaf 0 ) # 000000
FGRED=\$( tput setaf 1 ) # ff0000
FGGRN=\$( tput setaf 2 ) # 00ff00
FGYLO=\$( tput setaf 3 ) # ffff00
FGBLU=\$( tput setaf 4 ) # 0000ff
FGMAG=\$( tput setaf 5 ) # ff00ff
FGCYN=\$( tput setaf 6 ) # 00ffff
FGWHT=\$( tput setaf 7 ) # ffffff
BGBLK=\$( tput setab 0 ) # 000000
BGRED=\$( tput setab 1 ) # ff0000
BGGRN=\$( tput setab 2 ) # 00ff00
BGYLO=\$( tput setab 3 ) # ffff00
BGBLU=\$( tput setab 4 ) # 0000ff
BGMAG=\$( tput setab 5 ) # ff00ff
BGCYN=\$( tput setab 6 ) # 00ffff
BGWHT=\$( tput setab 7 ) # ffffff
RESET=\$( tput sgr0 )
BOLDM=\$( tput bold )
UNDER=\$( tput smul )
REVRS=\$( tput rev )

if [ \$EUID == 0 ]; then
  export PS1="\[\$FGRED\]\u\[\$FGMAG\]@\[\$FGCYN\]\h \[\$FGBLU\]\W\\$ \[\$RESET\]"
 else
  export PS1="\[\$FGGRN\]\u\[\$FGMAG\]@\[\$FGCYN\]\h \[\$FGBLU\]\W\\$ \[\$RESET\]"
fi
EOF