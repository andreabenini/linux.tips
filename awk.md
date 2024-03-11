# Tips 'n' Tricks on AWK

## Examples
Extract words from string with a different separator between them (`/` in this example)
```sh
echo "param1/param2/param3/..." | awk -F'/' '{print $2}'
```

## Links
- https://grimoire.carcano.ch/blog/the-ultimate-awk-tutorial-for-professionals/
