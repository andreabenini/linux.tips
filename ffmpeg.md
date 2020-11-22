# Concatenate two or more files
Create a list file with them, example content for `list.txt`
```
file file1.avi
file file2.avi
file file3.avi
...
```
Concatenate them in a single `output.avi` file
```
ffmpeg -f concat -i list.txt -c copy "output.avi"
```
that's it...
