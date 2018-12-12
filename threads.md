# List of threads in a process
```
#   F  S  UID  PID  PPID  LWP  C  NLWP  PRI  NI  ADDR  SZ  WCHAN  RSS  PSR  STIME  TTY  TIME  CMD
#
# PID : Process ID
# C   : CPU Time occupied by each thread
# LWP : ThreadID, this is what you can search into /tmp/myprocessname.stack.txt

# Get process and its threads:
ps -LlFm -p `pidof myprocessname`

# Dump process stack in a file
pstack `pidof myprocessname` > /tmp/myprocessname.stack.txt
```
Now you can search LWP number from file and see its stack trace
