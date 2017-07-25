## Clear cache buffers
```
# Clear PageCache only.
sync && echo 1 > /proc/sys/vm/drop_caches
# Clear dentries and inodes.
sync && echo 2 > /proc/sys/vm/drop_caches
# Clear PageCache, dentries and inodes.
sync && echo 3 > /proc/sys/vm/drop_caches 
```
Removing pagecache, dentries and inodes is *NOT* a good idea on an overloaded system, do it (only when necessary) when
you don't have heavy loads or your applications might crash

## Emptying swap pages and buffers
```
swapoff -a && swapon -a
```
To avoid an out of memory system you must be sure to execute it when you're not using too much memory (or swap)


## Ulimit
Ulimit is the number of open file descriptors per process. It is a method for restricting the amount of various resources a process can consume. The _"too many files open"_ error message comes out when you have reached the limits of opened files (Self Referencing... https://www.linux.com/blog/security-tip-avoid-fork-bombing-popular-distro-check-your-system)
```
ben@ben ~ $ ulimit -a
core file size          (blocks, -c) 0
data seg size           (kbytes, -d) unlimited
scheduling priority             (-e) 0
file size               (blocks, -f) unlimited
pending signals                 (-i) 31475
max locked memory       (kbytes, -l) 64
max memory size         (kbytes, -m) unlimited
open files                      (-n) 1024
pipe size            (512 bytes, -p) 8
POSIX message queues     (bytes, -q) 819200
real-time priority              (-r) 0
stack size              (kbytes, -s) 8192
cpu time               (seconds, -t) unlimited
max user processes              (-u) 31475
virtual memory          (kbytes, -v) unlimited
file locks                      (-x) unlimited
ben@ben ~ $ ulimit -u
31475
```
Set them from _/etc/security/limits.conf_ or _/etc/security/limits.d_ directory
