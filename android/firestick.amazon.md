# Homepage customization
Required software
- Launch manager (mini) https://www.techdoctoruk.com/sdm_downloads/lm-mini/
- Wolf Launcher (or whatever other nice launcher for fire tv) https://www.techdoctoruk.com/sdm_downloads/lm-mini/

Device setup
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
adb connect $FIRESTICK_IP
adb -s $FIRESTICK_IP shell appops set com.wolf.minilm SYSTEM_ALERT_WINDOW allow
adb -s $FIRESTICK_IP shell pm grant com.wolf.minilm android.permission.READ_LOGS
adb -s $FIRESTICK_IP shell dumpsys deviceidle whitelist +com.wolf.minilm
```
