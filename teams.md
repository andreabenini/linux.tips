# Microsoft Teams
### Hints, tricks, additional information
- double check time/date or you'll have authentication problems, it's a frequent problem with corporate accounts
- try to login with the web interface before using the desktop application, sometimes it helps a lot to understand your account status (locked, wrong credentials,
...)
- check out your repository and use only your latest certified version (or issue free one), BUGFIX and release information are a focus point here
- avoid installing nodejs stuff or electron ports, self contained version is always preferred. Installing nodejs modules usually break things if you install
them globally
- avoid chmod patches (sticky bits or suid) and chowning executable to privileges account (dont !)
- use web interface to investigate possible leaks, if there's something related to certificates or account privileges a browser login might detect it, use local
application later on when you're set

### Cleaning local configuration files
If you remove the package from your distro configuration files or personal preferences are kept in your home directory, if you want to get a rid of them
investigate those dirs and remove everything related to _Microsoft_ or _Teams_:
```sh
find .cache/ |grep -i team
find .config/ |grep -i team
find .local/ |grep -i team

# You should not have these if you're not using some node_modules or electron dependent stuff...
find .electron-gyp/ |grep -i team
find .yarn |grep -i team
```
