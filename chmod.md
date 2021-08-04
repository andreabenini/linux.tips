# chmod
## chmod on a link
this interesting section says:
```man
-h, --no-dereference
          affect symbolic links instead of any referenced file (useful only on systems that can change the ownership of a symlink)
```
So a brief:
```sh
sudo chown -h asterisk:asterisk mylinkfile
```
Assigns to `asterisk:asterisk` the symbolic link file only
