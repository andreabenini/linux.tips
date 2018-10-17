# List orphans packages
```
pacman -Qdt
```

# Remove orphans packages
```
pacman -Rsn $(pacman -Qdtq)
```
