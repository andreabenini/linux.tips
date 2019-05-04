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
