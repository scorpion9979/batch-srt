#!/bin/bash
OIFS="$IFS"
IFS=$'\n'
echo "Note: ffmpeg is necessary for using this script"
read -p "Enter directory (use absolute path): " dir
read -p "Enter subtitle track no.: " track
for file in $(ls "$dir"/*)
do
	if [ ${file: -4} == ".mp4" ]
	then
		dir=$(dirname "$file")
		base=$(basename "$file" ".mp4")
		ffmpeg -i $file -vn -an -codec:s:$track srt $base.srt
	fi
done
IFS="$OIFS"
