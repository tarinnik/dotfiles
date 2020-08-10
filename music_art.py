import sys
import os
import subprocess

home = "/home/thomas/"
music = f"{home}Music/"

song = sys.argv[1]
image = sys.argv[2]

os.chdir(music)

subprocess.call(["ffmpeg", "-i", song, "-i", image, "-c", "copy", "-map", "0", "-map", "1", "-metadata:s:v", "title=\"Album cover\"", "-metadata:s:v", "comment=\"Cover (Front)\"", "temp.mp3"])
os.remove(song)
os.rename("temp.mp3", song)
