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

# Remove tracks (Audio/Video) from file
```sh
# Gather information from file
ffpmeg -i filename.mkv

# Keep/Select only the required tracks, might be video or audio
ffmpeg -i filename.mkv -map 0:0 -map 0:1 -acodec copy -vcodec copy filenamenew.mkv
```

# Reduce file size with encoding
Entering down in the ffmpeg rabbit hole flags and options requires a certain amount of time and insanity
to better figure out all those nice features aimed to downsampling files. Here are my
favorites as a recap:
- `-i inputFile.mkv`  
    Obviously the file in, outputFile.xxx is always the last parameter
- `-vcodec libx264`  
    Tells it to use the standard H.264 video codec
- `-c:v libx265`  
    Uses the H.265 codec. Maintains a "good" quality at a high compression ratio
- `-crf 23`  
    This is the most important number, the scale goes from 0 to 51.  
    23/24 is the default and usually a great balance. If 23 is still too big, try 26 or 28
    - Lower number  = Higher quality, larger file size
    - Higher number = Lower quality, smaller file size
- `-preset slow`  
    Three interesting presets available: **_medium, veryfast, ultrafast_**
    but also: **_fast, medium, slow_**  (takes longer)
- `-c:a ac3 -b:a 640k`  
    Converts the likely-massive DTS-HD/TrueHD audio track to a standard 5.1
    surround sound format at a high bitrate

```sh
# -c:a aac -ac 2 -b:a 160k      (for Stereo audio only)
#           -c:a aac    Switches the audio codec to AAC (Advanced Audio Coding).
#           -ac 2       Audio Channels flag. Downmix the 5.1/7.1 source into 2-channel stereo
#                       FFmpeg handles the logic to avoid loosing center-channel dialogue
#           -b:a 160k   Set bitrate to 160kbps. For a stereo AAC track, 
#                       160k is considered "transparent" (high quality)
#                       640k is needed for 5.1.
# -filter:a "loudnorm"
#           When downmixing 5.1 surround sound to 2.0 stereo, the dialogue can sometimes
#           end up sounding very quiet compared to the explosions/music. 
#           If the output audio is too "thin," adding this filter would normalize the volume

# Force it to use h264
ffmpeg -i inputFile.mkv -vcodec libx264 -crf 23 -preset veryfast -c:a copy outputFile.mp4

# Also interesting is the h265 HEVC encoding
# H265 is highly efficient, often saving 50% more space than H264
# older devices (old TVs/computers) might struggle to play it
ffmpeg -i inputFile.mkv -vcodec libx265 -crf 28 -preset medium outputFile.mp4
```

# Convert 1080p -> 720p
Convert files in a directory from 1080p to 720p
```sh
#!/usr/bin/env bash
#
# Utility for converting src/* from 1080p to 720p
#
# ffmpeg -y -i input -c:v libx264 -b:v 2600k -pass 1 -an -f null /dev/null && \
# ffmpeg -i input -c:v libx264 -b:v 2600k -pass 2 -c:a aac -b:a 128k output.mp4
DIRSRC=/tmp/tmp/src/*
DIRDEST=/tmp/tmp/dst

for FILE in $DIRSRC; do
    FILEDST=`basename "$FILE"`
    ffmpeg -i "$FILE" -vf scale=-1:720 -c:v libx264 -crf 18 -preset veryslow -c:a copy "$DIRDEST/$FILEDST"
done
```

# Convert from Canon .mov file to a more modern .mp4  file
```sh
# Input    input.mov
# Output   output.mp4
ffmpeg -fflags +genpts -f avi -i input.mov -map 0:v:0 -map 0:a:0 -c:v libx264 -crf 23 -pix_fmt yuv420p -c:a aac -ar 44100 -b:a 128k output.mp4
```


# Crop video stream to the upper left region
Crop a full screen video capture to the upper left part of it (1920x1080) and
remove audio tracks too, useful for bigger screens and demos
```sh
ffmpeg -i inputVideo.mkv -vf "crop=1920:1080:0:0" -c:v libx264 -an outputVideo.mp4
```


# Convert webm to mp3
```sh
# -vn      # disable video
# -ab xxx  # audio bitrate
# -ar xxx  # audio sampling rate (in Hz)
ffmpeg -i filename.webm -vn -ab 128K -ar 44100 filename.mp3
```

# wav to mp3
```sh
# Classic codec, no frame adjustments
ffmpeg -i myfile.wav -acodec mp3 myfile.mp3

# Changing sound bitrate too
ffmpeg -i track01.wav -acodec mp3 -ab 64k track01.mp3

# lame does it too (and changes the bitrate in the middle if it's needed)
lame -b 128 input.wav output.mp3
```

# Play files
```sh
# Play mp3 file, full text command line, no display needed
ffplay -nodisp filename.mp3
```

# Office365 - Download Videos
Download View Only Video From Microsoft Sharepoint / Streams
### Force download from Share Point or Stream
`Chrome/Edge(F12) -> Inspector -> Network -> videomanifest?privode`
- Open the page with the video you want to download
- Ctrl+Shift+C to open the browser inspector
- Go to the Network tab, select filter to gather specific URL
    - Search for `videomanifest?provider=...` in the filter field
    - Copy that link address, this is usually a h264 direct stream,  
      it should be something looking like:
      ```txt
          videomanifest?provider=spo...
      ```
- Use ffmpeg to download the video. Command syntax:
    ```sh
        ffmpeg -i "https://videoManifestFullURL" -codec copy /tmp/download.mp4
    ```

