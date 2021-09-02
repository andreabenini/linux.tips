# History with time/date
To see at what time the commands were executed from the bash history I can use `HISTTIMEFORMAT` variable, here's an example:

```
HISTTIMEFORMAT="%d/%m/%y %T "
history
```

# History avoid duplicated entries
This will report a command just once
```
export HISTCONTROL=ignoredups:erasedups
```
But for a more complete list of command take a look at this:
- **ignorespace** – lines beginning with a space will not be saved in history.
- **ignoredups** – lines matching the previous history entry will not be saved. In other words, duplicates are ignored.
- **ignoreboth** – It is shorthand for “ignorespace” and “ignoredups” values. If you set these two values to HISTCONTROL variable, the lines beginning with a space and the duplicates will not be saved.
- **erasedups** – eliminate duplicates across the whole history.

# Execute last instance of a command
```sh
$ ls -laR test
  # ...whatever result...
$ !ls
  # this executes last instance of the 'ls' command with whatever parameter it had
```
