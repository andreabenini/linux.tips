# General
**[nohup](https://en.wikipedia.org/wiki/Nohup)** is a Unix command that is used to run another command while suppressing the action of the HUP (hangup) signal,
enabling the command to keep running after the user who issues the command has logged out. 
It is most often used to run commands in background as daemons.
Output that would normally go to the terminal goes to a file called nohup.out if it has not already been redirected.

## Run a script with nohup command
Type the command as follows to run a script called ~/myscript.sh:
```
$ nohup ~/myscript.sh &
```
