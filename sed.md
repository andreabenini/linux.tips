# Sed to remove some html output
Remove everything in between `<style>..</style>` tags
```
wget --verbose  "http://your.own.url/with/an/uri" 2>&1 | sed '/<style/,/style>/d'
```

# Convert tabs to spaces in every file (recursive)
This script will substitute tabs with four spaces in every file found in this root and its child directories (recursive), previous file is renamed as *.orig to keep original version. **Be careful: this scripts works in binary files too**
```
find . -type f -exec sed -i.orig 's/\t/    /g' {} +
```

# Change text between quotes
```sh
# SomeVar = 'dummytest'; -> SomeVar = 'cool';
sed -i "s/\(.*\)\(SomeVar = '\)\(.*\)'\(.*\)/\1\2cool'\4/" /name/of/the/file
```

# Delete file contents after a specific line
Delete all file contents after a specific line, if present
```sh
sed -i '/^<!--MARKUP LINE-->$/,$d' file.md
```

# Get text between tags
Extract a comment from the page
```sh
curl --no-progress-meter http://my.favorite.site.com/whatever/url/U/need | sed -n '/<!--/,/-->/p'
```
