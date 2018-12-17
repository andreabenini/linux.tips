# strace hints
Few and assorted hints on `strace` command

## realtime capture
`strace DaemonNameToTrace -h`

## on a running process
specify the running pid and you're set<br>
`strace -p 1841`

## recap of syscalls
This is a useful one because it gets all the syscalls from the selected process (ctrl+c to exit) in a specified period of
time<br>
`strace -c -p 1841`

## Trace dump (childs too)
strace on a specific process and dump its traffic to file. Its childs are straced as well<br>
`strace -ffttT -p 1841 -o /tmp/trace.output.out`





#### References
- https://www.tecmint.com/strace-commands-for-troubleshooting-and-debugging-linux/
- https://serverfault.com/questions/160739/monitor-system-cpu-system-calls-in-linux
