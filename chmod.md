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


# Using extended attributes
When classic UGO permission schema is not enough you can use extended permission schema with ACL,
**`setfacl`**, **`getfacl`** where introduced exactly for this reason back in the days (~2000)

```sh
# Grant to a user specific permissions on a directory
# it's ALWAYS better to specify the full path of it

# user1 (or root) does the whole operation
mkdir /mnt/user1/shared
# Grant rwx to both user1 and user2
setfacl -m u:user1:rwx /mnt/user1/shared
setfacl -m u:user2:rwx /mnt/user1/shared
# Grant default ACL entries as rwx, inherited permissions on files/dir inside it
setfacl -d -m u:user1:rwx /mnt/user1/shared
setfacl -d -m u:user2:rwx /mnt/user1/shared
# Give user 'user2' path traversal permissions on parent folder
setfacl -m u:user2:x /mnt/user1/shared

# Verify ACL setup
getfacl /mnt/user1/shared
```
When you verify ACL permissions with `getfacl` you'd see both `user1` and `user2` in the user group
and in default options too. for example:
```txt
# file: mnt/user1/shared
# owner: user1
# group: user1
user::rwx
user:user2:rwx
user:user1:rwx
group::r-x
mask::rwx
other::r-x
default:user::rwx
default:user:user2:rwx
default:user:user1:rwx
default:group::r-x
default:mask::rwx
default:other::r-x
```
Special permissions will be seen also on `ls -la` as:
```sh
# See the '+' of it
drwxrwxr-x+   2 user1 user1    4096 xxx nn nn:nn  shared
```
