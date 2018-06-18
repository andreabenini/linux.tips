# Sed to remove some html output
Remove everything in between `<style>..</style>` tags
```
wget --verbose  "http://your.own.url/with/an/uri" 2>&1 | sed '/<style/,/style>/d'
```
