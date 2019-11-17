# Execute commands from script and exit on fail
Execute a bunch of commands inside a script and exits on fail
```
#!/bin/bash
set -e
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
```
