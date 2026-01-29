# Cheat Sheet (preview page above)
http://htmlpreview.github.io/?https://github.com/andreabenini/linux.tips/master/systemd/SysVinit%20to%20Systemd%20Cheatsheet.html
https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units


## Basic unit management
The basic object that `systemd` manages and acts upon is a _"unit"_.
Units can be of many types, but the most common type is a _"service"_ (indicated by a unit file ending in `.service`).
To manage services on a `systemd` enabled server, our main tool is the `systemctl` command.  
All of the normal init system commands have equivalent actions with the `systemctl` command.
#### Start/Stop/Restart/Reload
I can start a service by typing
```
sudo systemctl start nginx
```
To stop it:
```
sudo systemctl stop nginx
```
The same goes for restarting:
```
sudo systemctl restart nginx.service
```
To attempt to reload a service without interrupting normal functionality, I can type (where service supports it):
```
sudo systemctl reload nginx.service
```


## Enable/Disable/Remove a service
By default, most systemd unit files are not started automatically at boot. To configure this functionality, you need to "enable" to unit. This hooks it up to a certain boot "target", causing it to be triggered when that target is started.  
To enable a service to start automatically at boot, type:
```
sudo systemctl enable nginx.service
```
If you wish to disable the service
```
sudo systemctl disable nginx.service
```
Removing a service from system should be an easy thing but follow these steps:
```
systemctl stop [servicename]
systemctl disable [servicename]
rm /etc/systemd/system/[servicename]
rm /etc/systemd/system/[servicename]         # symlinks that might be related
rm /usr/lib/systemd/system/[servicename]
rm /usr/lib/systemd/system/[servicename]     # symlinks that might be related
systemctl daemon-reload
systemctl reset-failed
```

## Restart a network interface
`systemd ... restart` service might be used but `networkctl` should be preferred instead.  
```sh
# Reconfigure interface named 'wan'
sudo networkctl reconfigure wan
# global reload, rather invasive
sudo networkctl reload
```
Additional nodes:
- Avoid running `systemctl restart systemd-networkd` if critical services are running on other interfaces, as it momentarily takes all managed interfaces down and up
- Do **not** use `daemon-reload` unless needed. `daemon-reload` is only for Service Unit files (.service) and it ignores changes inside systemd-networkd configuration files (.network)


## Status of a service/socket
```sh
# As easy as:
systemctl status podman.socket

# Root detecting active services (or sockets like in this case) for a specific user
# Users can have their own defined services, they're not directly related to system services
systemctl --machine=ben@.host --user status podman.socket
```

## Getting an Overview of the System State
To get all of the unit files that systemd has listed as _active_, type:
```sh
systemctl list-units
# or simply filter all services only because I'm looking for them only
systemctl list-units --type=service
```
If you want to see them on a user level (locally managed services held by a single user)
```sh
systemctl list-units --user --type=service
# usually dbus-broker might come around when running in a desktop manager, just ignore it
```
To list all the units that systemd has loaded or attempted to load into memory,
including those that are not currently active just add the `--all` switch
```sh
systemctl list-units --all
```
To list all of the units installed in a system, 
this includes those that systemd has not tried to load into memory
```sh
systemctl list-unit-files
```


## Editing Units and Unit Files
A unit file contains parameters to handle a unit  

Contents of a unit file
```
systemctl cat nginx
```
Modifying unit file
```sh
# Documentation refers to editing a snippet
systemctl edit nginx.service

# Prefer the file entire content, always
systemctl edit --full nginx.service

# Always reload systemd process to pick changes
sudo systemctl daemon-reload
```
details on unit's setup
```
systemctl show nginx
```
Unit dependencies
```
systemctl list-dependencies nginx
```
Unit dependencies (recursive)
```
systemctl list-dependencies --all nginx
```

## Disable systemd pager
On CentOS and other Distros (Ubuntu/...) the pager is enabled by default, to remove it you can:  
- Use the `--no-pager` flag
- Disable it by default, just add this to your `/etc/profile`
```sh
export SYSTEMD_PAGER=''
```

# Run service as with a specific user
```
[Service]
User=<favorite.user>
Group=<favorite.group>
```

# Run a specific command as the last in the boot process
- This guy has a nice hint: create a custom target  
    https://www.mauras.ch/systemd-run-it-last.html

# User specific services (controlled by himself)
Each single user may have its own .service files, everything written here is still valid and applicable on specific user settings.
Just use `--user` flag on each single command.  
Systemd will take care of your settings and create a `$HOME/.config/systemd/user` folder where it will store your setup.  
This is called **user lingering** and should be applied to user supplied or specific services run by a user.  
More information https://wiki.archlinux.org/index.php/Systemd/User, seems to be an effective way to start user specific daemons (mpd, gaming services and so on)
## Lingering management
### Explicitly enabling lingering for a defined user
This ensures the **myuser** user's processes start at boot and keep running even
when the user isn't logged in.  
Lingering properties on systemd are usually saved as empty files in the directory
`/var/lib/systemd/linger`. **loginctl** is basically a wrapper to it
```sh
loginctl enable-linger myuser

# creates the empty file /var/lib/systemd/linger/myuser
```
### Revoke lingering to users
This removes the lingering previously applied to users
```sh
loginctl disable-linger myuser
```
### List users
Users with special lingering can be listed with this command
```sh
loginctl list-users
```

# Targets (aka RunLevels)
An init system transitions between different states and it typically refers to them as "runlevels", it allows to be in one
level at a time.
Systemd they're referred as _"targets"_. They're synchronization points that can be used to bring the machine to a specific
state. Service and other unit files can be tied to a target and multiple targets can be active at the same time.

Available targets on a system
```
systemctl list-unit-files --type=targetName
```

To view default target systemd tries to reach at boot which starts all the unit files that make up the dependency
tree
```
systemctl get-default
```
Change the default target that will be used at boot
```
sudo systemctl set-default multi-user.target
```
See what units are tied to a target
```
systemctl list-dependencies multi-user.target
```
You can modify the system state to transition between targets with the isolate option.
This will stop any units that are not tied to the specified target.
Be sure that the target you are isolating does not stop any essential services
```
sudo systemctl isolate multi-user.target
```


## Clear log
The self maintenance method is to vacuum the logs by size or time.
```
# Retain only the past two days:
journalctl --vacuum-time=2d

# Retain only the past 500 MB:
journalctl --vacuum-size=500M
```

## Live log
See current log agent on stdout
```
journalctl -f
```

## Find log failures from journalctl
```sh
journalctl --no-pager --since today --grep 'fail|error|fatal' --output json|jq '._EXE' | \
           sort | uniq -c | sort --numeric --reverse --key 1
```

## Detect if service is running (from script or whatever)
```
systemctl is-active sshd && echo "ON" || echo "OFF"
```

## Reduce number of auto VTs on a system
/etc/systemd/logind.conf
```
NAutoVTs=1
# Default is 6, adjust it to whatever number you'd like (1 as example)
```

# Dealing with errors
Shit happens, each day, and systemd is happy when something is broken. I'm not that happy and sometimes I need to fix its crap in 
unusual ways.
## "failed to connect to bus: Connection refused"
dbus was peaceful place before systemd but when you see this weird message you basically need to solve with one of these methods:
```
# Method 1
- Kill|Restart dbus, init
- dbus-launch to restart everything
# Method 2
- reboot/shutdown/poweroff
# Method 3
- systemctl reboot -ff
```
I personally hate systemctl wrapper around UNIX commands but when it broke or you're not been able to communicate with dbus you
absolutely need to use it. Method3 only when you absolutely know what you're doing.
