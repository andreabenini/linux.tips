# Concatenate two or more files
Create a list file with them, example content for `list.txt`
```sh
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

# Change video resolution
To change video resolution on a file just use these flags
```sh
# FullHD video resize (1920x1080) from 4K video but it works from lower resolutions too
# "-2" instead of "1080" just keep up current resolution (4:3 / 16:9 / 16:10 / ...) by using just one dimension
ffmpeg -i input.mkv -vf scale=1920:-2 output.mkv
```
