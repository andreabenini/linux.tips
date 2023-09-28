# Install
Visual Studio Code is built on Electron framework and the official release contains some proprietary branding. 
For this reason, it is not provided by official openSUSE repositories.  

You can use Microsoft's repositories to install and update Visual Studio Code.  

```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode
sudo zypper refresh
sudo zypper install code
```
