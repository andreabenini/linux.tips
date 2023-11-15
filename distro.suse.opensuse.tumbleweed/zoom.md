# Zoom: Installation and Configuation
Zoom is not available through default repository and it should be downloaded from their website (https://zoom.us).  
To install it properly you need to:
```sh
# Import the public key to trust software authors
# - change version accordingly, check on their website for it
wget "https://zoom.us/linux/download/pubkey?version=5-12-6" -O package-signing-key.pub
# Install the key
sudo rpm --import package-signing-key.pub

# Install the main package and its dependencies, if any
wget https://zoom.us/client/latest/zoom_openSUSE_x86_64.rpm
sudo zypper install zoom_openSUSE_x86_64.rpm
```
