#!/bin/bash
OIFS="$IFS"
IFS=$'\n'
echo "Note: mkvextract is necessary for using this script"
read -p "Enter directory (use absolute path): " dir
read -p "Enter mkvextract track no.: " track
for file in $(ls "$dir"/*)
do
	if [ ${file: -4} == ".mkv" ]
	then
		dir=$(dirname "$file")
		base=$(basename "$file" ".mkv")
		mkvextract tracks $file $track:$dir/$base.srt
	fi
done
IFS="$OIFS"
