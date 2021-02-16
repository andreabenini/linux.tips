# Run command for certain amount of time
Use `timeout` system utility (**man timeout**).  
Run a command with a time limit". Example:
```
timeout 5s ls -la
# or something like "timeout 5s your very long command with parameters"
```
It basically runs your command and after the specified duration it will kill it.
