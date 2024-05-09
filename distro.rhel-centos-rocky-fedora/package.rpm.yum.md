# View full history of YUM transactions
```
yum history
```
This command shows:
- transaction id
- login user who executed the particular action
- date and time when the operation happened
- the actual action and additional information about any thing wrong with the operation:


# Package name from file
To understand what package has installed a specific file there's a simple trick that is almost valid for every rpm based distribution, basically:
- search your file across the whole system and note its absolute position:  
  `find / -name the.file.you.are.searching 2>/dev/null`
- query the RPM database for it, if rpmdb is not corrupted you might easily find it there:  
  `rpm -qf /absolute/path/for/the.file.you.are.searching`
