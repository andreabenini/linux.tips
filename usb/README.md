## USB Gadget Topics:
- kernel detection  
    https://wiki.postmarketos.org/wiki/USB_Gadget
- USB gadget on Linux & how to integrate it with systemd  
    https://www.collabora.com/news-and-blog/blog/2019/02/18/modern-usb-gadget-on-linux-and-how-to-integrate-it-with-systemd-part-1/
- Arch over g_ether ipad  
    https://archlinuxarm.org/forum/viewtopic.php?f=59&t=13671
- PocketBeagle on Arch
    Nice guide for beaglebone with some usb gadget real samples  
    https://archlinuxarm.org/forum/viewtopic.php?f=48&t=12623
- g_ether  
    https://www.reddit.com/r/SteamDeck/comments/10ps589/usb_gadget_mode_on_sd_will_essentially_turn_any/
- How to Use USB Gadget Ethernet  
    https://linuxlink.timesys.com/docs/wiki/engineering/HOWTO_Use_USB_Gadget_Ethernet
### Troubleshooting
- udc-core: couldn't find an available UDC - added [g_mass_storage] to list of pending drivers
    https://unix.stackexchange.com/questions/373569/emulating-usb-device-with-a-file-using-g-mass-storage-udc-core-couldnt-find


## USB-C ethernet links between two computers
Interesting experiment for a network connection without eth transceivers, here are few useful links
- Some basics first, read and understand it before going further:  
    How does USB-C affect USB's distinction between "host" and "peripheral"?  
    https://superuser.com/questions/1140136/how-does-usb-c-affect-usbs-distinction-between-host-and-peripheral
- Is it possible to connect two PCs via USB C ?  
    DRD (Dual Role Device) explaination:  
    https://superuser.com/questions/1215710/is-it-possible-to-connect-two-pcs-via-usb-c
- CDC+RNDIS connection:  
    https://superuser.com/questions/593757/the-best-way-to-do-tcp-ip-over-usb-on-linux
- (ML kernel.org) DRD device mode on Intel Gemini Lake
    https://lore.kernel.org/all/CAGR4S9GnD6CbZXbO+cA0HUY_8BOpRqkWmqcmVw=i4yEtgOhFKg@mail.gmail.com/T/
- \> 5Gbps USB-Eth adapters review:  
    https://www.servethehome.com/usb-3-1-gen1-to-5gbe-network-adapter-guide/
- USB_ethernet script for steam deck:  
    https://gist.github.com/dafta/0aadeba3aa8bcbbc8b92a233977571ed
- https://developer.ridgerun.com/wiki/index.php/How_to_use_USB_device_networking

## testusb
- Test a Linux kernel USB Device Controller driver with testusb
    https://bootlin.com/blog/test-a-linux-kernel-usb-device-controller-driver-with-testusb/
