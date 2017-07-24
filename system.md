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
