# youtube-dl
youtube stream downloader, AD free and easy to script on command line, here's a sample


## download.sh
Download a file, keep audio tracks only into an mp3 file, remove excess youtube hash info
```sh
#!/usr/bin/env bash
#
# Download audio from youtube
# - youtube-dl command utility to download the file
# - Extract just audio data and store it into an .mp3 file
# - Remove youtube excess 'v=XXXXX' information from that
#
URL_YOUTUBE=$1
PROGRAM=youtube-dl
STRIP=`echo "$URL_YOUTUBE"    | sed -e 's/.*\=/-/'`
if [ "`which $PROGRAM`" == "" ]; then
    echo "$PROGRAM not installed, aborting with error"
    exit 1
fi
$PROGRAM --extract-audio --audio-format mp3 $URL_YOUTUBE
FILE_DOWNLOAD=`ls -1 *.mp3    | grep -e "$STRIP"`
FILE_NEW=`echo $FILE_DOWNLOAD | sed -e "s/$STRIP//"`
echo "[rename] '$FILE_DOWNLOAD' -> '$FILE_NEW'"
mv "$FILE_DOWNLOAD" "$FILE_NEW"
```
