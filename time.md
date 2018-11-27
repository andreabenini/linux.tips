# Time function utilities in bash scripting
## SECONDS variable
`$SECONDS` is a builtin shell script variable and returns a count of the number of (whole) seconds the shell has been running.
If you reset it will be incremented automatically so it can be used to calculate the execution time of a certain
task.

```sh
SECONDS=0
curl -T $TMPDIR/$file.txt -X PUT -L "http://somewhere.remote.url.site/upload/$file.txt"
duration=$SECONDS
echo "Total Duration: $duration secs.     $(($duration / 60)) mins, $(($duration % 60)) secs."
```
So this can be used to calculate a time consuming (or cpu intensive) operation
