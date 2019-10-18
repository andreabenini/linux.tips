# How to add ed2k links to current queue
## With ed2k command line utility
Simple as that:
```sh
cat ed2k.txt |xargs -L1 ed2k
```
...and without `xargs` is even better
```
user@host ~ $ ed2k --help
aMule ED2k link parser vx.x.x

Usage:
    --help, -h              Prints this help.
    --config-dir, -c        Specifies the aMule configuration directory.
    --version, -v           Displays version info.

    --category, -t          Add Link to category number.
    magnet:?                Causes the file to be queued for download.
    ed2k://|file|           Causes the file to be queued for download.
    ed2k://|server|         Causes the server to be listed or updated.
    ed2k://|serverlist|     Causes aMule to update the current serverlist.

    --list, -l              Show all links of an emulecollection
    --emulecollection, -e   Loads all links of an emulecollection
```
List an emulecollection file
```
user@host ~ $ ed2k --list <FILE NAME.emulecollection>
```
Add an emulecollection queue to download list
```
user@host ~ $ ed2k --emulecollection <FILE NAME.emulecollection>
```

## With amulecmd
```sh
cat ed2k.txt | xargs -I MYFILE    amulecmd -h localhost -P MyPerfectPassword -c "Add MYFILE"
```


# Command line amulecmd
`amulecmd` is a useful utility even to issue batch jobs from command line, this is a nice way to script and automate things, for example:
```
amulecmd -h localhost -P MyCoolPasswordForIt  <<EOT
show servers
show dl
show ul
status
EOT
```
Commands are defined in the amule protocol.
