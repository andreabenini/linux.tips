# inotify
_what it is_  
The inotify API provides a mechanism for monitoring filesystem events.
Inotify can be used to monitor individual files, or to monitor directories.
When a directory is monitored, inotify will return events for the directory itself, and for files inside the directory.

## Installation
```sh
# yum/apt/pacman....
# package name is 'inotify-tools', so, for example:
pacman -S inotify-tools
```
Inotify watch for changes in files and/or directories and then can trigger other actions, like rsync for example.

## watcher script example
```sh
#!/bin/bash
#   waits until an event: modify,create,delete,move happens
#   execute rsync when triggered from inotify event
#   --delete-after: without this any deletion in src will not be replicated to dst
while inotifywait -r -e modify,create,delete,move /my/path/src; do
    rsync -avz /my/path/src/ /my/path/dst --delete-after
done
```
