# Adobe Source Code Pro fonts installation
They're not provided as a Kali package so a manual installation is needed, as simple as that:
```sh
USER=ben
GROUP=$USER

sudo rm -rf /opt/source-code-pro
sudo mkdir -p /opt/source-code-pro
sudo chown $USER:$GROUP /opt/source-code-pro
git clone https://github.com/adobe-fonts/source-code-pro /opt/source-code-pro

sudo mkdir -p /usr/share/fonts/opentype/font-adobe-source-code-pro
sudo cp -f /opt/source-code-pro/OTF/*  /usr/share/fonts/opentype/font-adobe-source-code-pro
sudo fc-cache -fsv
```
