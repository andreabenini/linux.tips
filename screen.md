# Troubles/Errors
## Cannot open your terminal...
```
Solve screen error "Cannot open your terminal '/dev/pts/x' - please check"
```
When using the screen tool you may be unable to start a screen session but instead encounter this error,
there are two ways to resolve this:
```
# 1 #
# Sign out and properly connect / sign in as the user you wish to use.

# 2 # Own the shell with script, then try screen again.
script /dev/null
```
