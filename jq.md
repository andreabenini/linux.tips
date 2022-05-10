# JSON Formatter
`jq` is a well known command line utility aimed for pretty printing common json files or format json streams in a
human friendly and legible output.
### Basic usage
```sh
# Easy usage on a common json file
jq '.' filename.json
# Or format something from a stream
cat filename.json | jq '.' -
```

### Keeping colors
Everybody loves colors and using `less` might help too.
```sh
jq '.' -C filename.json |less -R
```
