# Detecting $JAVA_HOME
Here's a simple but effective way to detect $JAVA_HOME with just a one liner expression,
seems to be fine on desktop and server distros
```
export JAVA_HOME="`readlink -f /usr/bin/java | sed 's:/bin/java::'`"
```
Place it in your `/etc/profile` file or wherever you might need it to keep this setting globally or locally for a single user
