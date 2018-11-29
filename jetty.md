# Configuration

Path cleanup
```
# Directory Setup
ln -s /opt/jetty-xxx.xx.xx /opt/jetty
ln -s /opt/jetty/ /opt/jetty/jetty      # lrwxrwxrwx jetty -> .
```

systemd configuration

*`/usr/lib/systemd/system/jetty.service`*
```sh
[Unit]
Description=Jetty Web Application Server
After=syslog.target network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
User=jetty
Group=jetty
ExecStart=/opt/jetty/bin/jetty.sh start
ExecReload=/opt/jetty/bin/jetty.sh restart
ExecStop=/opt/jetty/bin/jetty.sh stop

[Install]
WantedBy=multi-user.target
```

*`/etc/default/jetty`*
```sh
JETTY_HOME=/opt/jetty
JETTY_USER=jetty
JETTY_PORT=8080
JETTY_HOST=0.0.0.0
JETTY_PID=/opt/jetty/jetty.pid
```

*`/opt/jetty/start.ini`*
```sh
# Add this line for standard logging
--module=console-capture

# uncomment this to automatically reload apps inside webapps
# Monitored directory path (fully qualified)
jetty.deploy.monitoredPath=/opt/jetty/webapps
```
