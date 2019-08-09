# ps with full command line
`-w` Use 132 columns to display information, instead of the default which is your window size.
If the `-w` option is specified more than once, ps will use as many columns as necessary without regard for your window size.
Note that this option has no effect if the **command** column is not the last column displayed.
```
ps auxww
```

# Sort Processes by memory usage
```
ps aux | sort -nk 4
```
# Sort Processes by CPU usage
```
ps aux | sort -nk 3
```
