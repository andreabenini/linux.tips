# How to add ed2k links to current queue
## With ed2k command line utility
Simple as that:
```sh
cat ed2k.txt |xargs -L1 ed2k
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
