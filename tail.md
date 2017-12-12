Nice tip for coloring log files on screen while receiving it in real time.
Edit __sed__ condition to match whatever it needs to get properl match
```bash
tail -f logs/SomeLogFile.log | sed \
    -e 's/\(.*\[critical\].*\)/\o033[95m\1\o033[39m/' \
    -e 's/\(.*\[error\].*\)/\o033[91m\1\o033[39m/' \
    -e 's/\(.*\[warning\].*\)/\o033[93m\1\o033[39m/' \
    -e 's/\(.*\[notice\].*\)/\o033[96m\1\o033[39m/' \
    -e 's/\(.*\[debug\].*\)/\o033[92m\1\o033[39m/'
```
Use `-F` instead of `-f` to track changes to the file by filename, instead of using the inode number which changes during rotation. It will also keep trying to open the file if it's not present.
