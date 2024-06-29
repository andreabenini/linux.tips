# Homepage customization
Required software
- Launch manager (mini) https://www.techdoctoruk.com/sdm_downloads/lm-mini/
- Wolf Launcher (or whatever other nice launcher for fire tv) https://www.techdoctoruk.com/sdm_downloads/lm-mini/

### Device setup
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

# Open adb shell interactively
adb -s $FIRESTICK_IP shell

# Get bluetooth address
adb -s $FIRESTICK_IP shell settings get secure bluetooth_address

# Various adb commands
adb -s $FIRESTICK_IP shell appops set com.wolf.minilm SYSTEM_ALERT_WINDOW allow
adb -s $FIRESTICK_IP shell pm grant com.wolf.minilm android.permission.READ_LOGS
adb -s $FIRESTICK_IP shell dumpsys deviceidle whitelist +com.wolf.minilm
```

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
