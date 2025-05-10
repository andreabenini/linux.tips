# mkinitcpio warning messages
When initramfs are being rebuilt after a kernel update, there might get warnings like these:
```txt
# module name might change but result is almost the same
==> WARNING: Possibly missing firmware for module: 'ast'
```
When messages are related to the _default_ initramfs image, then installing additional firmware should be required.  
When messages appears **only** during the generation of the _fallback_ initramfs image there are two possible options:
- Ignore the warning, fallback usually tries to add more modules for a safer boot, having the warnings just here basically means it's not really needed
- suppress the warning for a clean output, unnecessary but sometimes nicer to see, this is what will be described here


## Testing mkinicpio fallback image generation
There's usually something like:
```sh
sudo mkinitcpio -k /boot/vmlinuz-linux -g /boot/initramfs-linux-fallback.img -S autodetect
```
Arch linux uses to generate fallback image, if that warning is seen during this command execution it also might be suppressed, up to you to decide what you should do.


## How to suppress it
- Considering this exact case:
```txt
==> WARNING: Possibly missing firmware for module: 'ast'
```
You can detect package name for `ast` from AUR as this page suggests:  
https://wiki.archlinux.org/title/Mkinitcpio#Possibly_missing_firmware_for_module_XXXX  
and when firmware is extracted from `ast_dp501_fw.tar.gz` a file named `ast_dp501_fw.bin` will usually be created in `/usr/lib/firmware/ast_dp501_fw.bin`
- AUR reference for that exact firmware module is located in: https://aur.archlinux.org/packages/ast-firmware (alse see Arch's Wiki reference listed above)
- To suppress that message it's just a matter of creating a dummy file for it with that name, something like:  
```sh
echo "Device not available" | sudo tee /usr/lib/firmware/ast_dp501_fw.bin
```
- Run the mkinitcpio command on fallback image generation again, now the warning is gone. For example:  
```sh
sudo mkinitcpio -k /boot/vmlinuz-linux -g /boot/initramfs-linux-fallback.img -S autodetect
```
