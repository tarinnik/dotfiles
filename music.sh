#!/bin/bash

youtube-dl -f bestaudio -i -o '~/tmpmusic/%(title)s.%(ext)s' $1

cd ~/tmpmusic

for file in *.*; do
	echo $file
	ffmpeg -i "$file" "/home/thomas/Music/${file%.*}.mp3"
	rm "$file"
done

