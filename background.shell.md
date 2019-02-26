# How to run an already running process in background
if you have a program running in the foreground then:
- press **Ctrl-Z** to suspend the running program, it will displays a job number and a "Stopped" message
  and returns you to a bash prompt
```sh
[1]+  Stopped                 myprogram
```
- Disowning the process with `disown`
```sh
disown -h %1
```
  I've used a 1, but you'd use the job number that was displayed in the Stopped message) which marks the job
  so it ignores the SIGHUP signal (it will not be stopped by logging out). If there is only one job, then you
  don't need to specify the job number. Just use `disown -h`
- Make it running in background
```sh
bg 1
```
  The `bg` command uses the same job number to make it running in background.
  This resumes the running program in the background and a message is displayed confirming that.
```sh
[1]+ myprogram &
```
- You can now log out and it will continue running.

