# List of installed packages
```
# detailed list, multiple lines per package
pacman -Qi
# one line for each single package
pacman -Qe
```

# List orphans packages
```
pacman -Qdt
```

# Remove orphans packages
```
pacman -Rsn $(pacman -Qdtq)
```

# Remove multiple packages and their dependencies
```
pacman -Rnsu pack1 pack2
```
