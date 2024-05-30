# Tags management
### Get text between tags
Extract a comment from the page
```sh
curl --no-progress-meter http://my.favorite.site.com/whatever/url/U/need | sed -n '/<!--/,/-->/p'
```
### Get value of a tag from a XML stream
Same as above but extract only the value between `<author/>` tag
```sh
cat myXMLstream | sed -n 's/.*<author>\(.*\)<\/author>.*/\1/p'
```


# Delete file contents after a specific line
Delete all file contents after a specific line, if present
```sh
sed -i '/^<!--MARKUP LINE-->$/,$d' file.md
```


# Sed to remove some html output
Remove everything in between `<style>..</style>` tags
```sh
wget --verbose  "http://your.own.url/with/an/uri" 2>&1 | sed '/<style/,/style>/d'
```

# Removing comments from a file
```sh
sed '/^#\|^$\| *#/d' httpd.conf
```

# Replace case insensitive word in a file
```sh
sed 's/[Zz]ip/rar/g' /name/of/the/file
```


# Change text between quotes
```sh
# SomeVar = 'dummytest'; -> SomeVar = 'cool';
sed -i "s/\(.*\)\(SomeVar = '\)\(.*\)'\(.*\)/\1\2cool'\4/" /name/of/the/file

# Replacing words in a file on a given line range only
sed '10,20 s/oldstring/newstring/g' /name/of/the/file
```


# Convert tabs to spaces in every file (recursive)
This script will substitute tabs with four spaces in every file found in this root and its child directories (recursive), previous file is renamed as *.orig to keep original version. **Be careful: this scripts works in binary files too**
```
find . -type f -exec sed -i.orig 's/\t/    /g' {} +
```

# Viewing a range of lines from a file
```sh
# print lines from 10 and 20 from myfilename
sed -n '10,20p' myfilename
# same as above but scattered around it (lines between 10,20 and lines between 30,40)
sed -n -e '10,20p' -e '30,40p'
```
# Viewing the entire file but a given range
```sh
# print the whole file but lines from 10 and 20
sed '10,20d' myfilename
```


# dos2unix with sed
```sh
sed -i 's/\r//' /name/of/the/file
```
