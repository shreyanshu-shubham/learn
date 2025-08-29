sudo pacman -S xorg-xinit xorg git

mkdir ~/src
cd ~/src

git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/st

# installing dwm
sudo pacman -S libx11 libxft libxcomposite libxinerama

cd ~/src/dwm
sudo make clean install

# write "exec dwn" to ~/.xinitrc
startx