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
