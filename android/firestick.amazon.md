## Homepage customization
Additional software
- Launch manager (mini) https://www.techdoctoruk.com/sdm_downloads/lm-mini/
- Launch on boot [28907]: https://play.google.com/store/apps/details?id=com.andreabianchini.launchonboot&hl=en_US
  - enabled
  - launch when device wakes up
  - launch tv app on boot (disabled)
- Project Ivy Launcher [28907]: https://play.google.com/store/apps/details?id=com.spocky.projengmenu&hl=en_US
- Wolf Launcher (or whatever other nice launcher for fire tv) https://www.techdoctoruk.com/sdm_downloads/lm-mini/
- [Moonlight game streaming](https://www.amazon.com/Cameron-Gutman-Moonlight-Game-Streaming/dp/B00JK4MFN2) Streams games from the PC to the local network

## adb device setup
```sh
# they're now restricting devices more and more, even local adb is now forbidden (why ?),
# this remote hack circumvents these fancy guys by setting permissions in the android 
# registry, provide remote ip address, enable developer mode and you are ready to go
FIRESTICK_IP=192.168.0.100

# Connect to remote firestick through adb
adb connect $FIRESTICK_IP
# grant permissions to Launch Manager mini
adb -s $FIRESTICK_IP shell pm grant com.wolf.minilm android.permission.SYSTEM_ALERT_WINDOW
adb -s $FIRESTICK_IP shell pm grant com.wolf.minilm android.permission.READ_LOGS
# whitelist Launch Manager mini to allow its safe execution
adb -s $FIRESTICK_IP shell dumpsys deviceidle whitelist +com.wolf.minilm
```

### Useful commands
Random order for common commands
```sh
# Connect to device
adb connect $FIRESTICK_IP
# Disconnect from device
adb disconnect

# Open adb shell interactively
adb -s $FIRESTICK_IP shell
# Execute a single command in the shell and quit
adb -s $FIRESTICK_IP shell "ls -la"
# Execute a single command in background in the shell. In the end it's always a unix shell btw
# Detatch stdin and stdout if it's needed, nohup style as usual
adb shell "nohup sh /your/favorite/shell/command.sh >/dev/null 2>&1 &"

# Start an application from remote, example: wolf launcher
adb -s $FIRESTICK_IP shell am start com.wolf.firelauncher

# Kill an application by forcing a crash, useful for protected applications too
adb -s $FIRESTICK_IP shell am crash com.amazon.tv.launcher
# this does not work on protected applications
#adb -s $FIRESTICK_IP shell am kill  com.amazon.tv.launcher

# Get bluetooth address
adb -s $FIRESTICK_IP shell settings get secure bluetooth_address

# Get installed applications
adb -s $FIRESTICK_IP shell pm list packages

# Get/Set properties from device
adb -s $FIRESTICK_IP shell appops get --uid com.ghisler.android.TotalCommander MANAGE_EXTERNAL_STORAGE
adb -s $FIRESTICK_IP shell appops set com.wolf.minilm SYSTEM_ALERT_WINDOW allow
# Various adb commands
adb -s $FIRESTICK_IP shell pm grant com.wolf.minilm android.permission.READ_LOGS
adb -s $FIRESTICK_IP shell dumpsys deviceidle whitelist +com.wolf.minilm

# Getting running application from the system
# ...from the shell
ps -A 2>&1|grep com.amazon.tv.launcher >/dev/null; echo $?
# ...from the activity manager
adb -s $FIRESTICK_IP shell logcat -s ActivityManager:I *:S | grep --line-buffered "com.amazon.tv.launcher"

# Execute commands with application's permissions
adb -s $FIRESTICK_IP exec-out run-as org.xbmc.kodi ls -R
```

### Disable power saving features
The FireStick is aggressive about saving power, when you walk into the room, see a black screen, 
and don't know if the TV is off or if the Stick is just sleeping. These flags will definitively
turn it always on
- Initial setup
  - First Generation Firesticks
    - Settings / Display & Sounds / Screensaver
      - Set **Start Time** to *Never*
    - Settings / Preferences / Data Usage Monitoring
      - Turn **Still watching** to _off_
    - Settings / Display & Sounds / Ambient Experience
      - Turn **Automatic Start** to _off_
  - Second Generation Firesticks
    - Settings / Display & Sounds / Ambient Experience
      - Turn ** Ambient Experience** to _off_
- ADB Commands  
Use both commands to finally disable all fancy features, it's up to you to decide when you want
to turn the TV ON/OFF
  - Disable timeout to avoid power saving features  
    `adb shell settings put secure sleep_timeout 0`
  - Avoid screen dim and going black  
    `adb shell settings put system screen_off_timeout 2147483647`


### External storage setup
From the adb shell command:
```sh
# List of available disks, hopefully your ready new recognized drive
sm list-disks


# Partition external device for Fire Stick usage
# "disk:8,0" is the name of the external disk, see 'sm list-disks' to get it

# Partition the entire disk for application/internal storage only
sm partition disk:8,0 private
# Partition the entire disk for storing photo,music,external media
sm partition disk:8,0 public
# half/half private and public usage
sm partition disk:8,0 mixed 50 50
```

### Hacking 1st generation firestick TV 4k **and get USB support back !**
Amazon simply hid USB storage options and apparently disabled external storage management
on each single menu and configuration.  
Even if it's highly undocumented it's still possible to manage external USB storage devices for
storing data or extending applications memory, although ADB commands are required for it.
`pm` move commands are here to help
```sh
# - First: refer to the section above to properly format the external drive

# - Disconnect the external USB drive and report your current file system disk space usage
df -h

# - Connect the external USB drive to the system
# - Check if the connected storage is currently supported from the kernel. If you see it
#   automounted it basically means Linux is able to use it and Android above might use the
#   associated memory for storing data or apps.
# - Take a look at the differencies and your new drive probably have a partition ID mounted,
#   copy that partition id
df -h

# - List available/installed packages
# - Not every package can be moved in the external storage, luckily some programs like kodi 
#   can be moved
pm list packages
pm list packages | grep kodi

# Manually moving applications from local internal memory to an external USB storage
# syntax:  pm move-pacakge packageName partitionID
# example:
pm move-package org.xbmc.kodi 9d103a43-56e3-4b0c-91dd-fc70178ee73a

# Extra tip: if you're hacking here'n'there or swapping storage drives and the above command
#   failed just try to move it in the internal memory and then back to the external storage
pm move-package org.xbmc.kodi internal
# and then move it back to the newly created storage drive
pm move-package org.xbmc.kodi 9d103a43-56e3-4b0c-91dd-fc70178ee73a

# Start the moved program to see if it works and install something (like skins) to verify
# you're effectively using that new disk...
df -h
```
