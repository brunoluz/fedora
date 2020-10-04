# grup file
sudo vim /etc/default/grub

## BIOS ##
sudo grub2-mkconfig -o /boot/grub2/grub.cfg

## UEFI ##
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg