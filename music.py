import sys
import os
import subprocess

if len(sys.argv) > 1:
    url = sys.argv[1]
else:
    print("No URL specified")
    quit()

if len(sys.argv) > 2:
    start = sys.argv[2]
else:
    start = 0

if len(sys.argv) > 3:
    end = sys.argv[3]
else:
    end = None

subprocess.call(["youtube-dl", "-f", "bestaudio", "-i", "-o", "~/tmpmusic/%(title)s.%(ext)s", url])

os.chdir("/home/thomas/tmpmusic")
try:
    tmpfile = os.listdir()[0]
except IndexError:
    print("Unable to download the file")
    quit()

song_name = tmpfile[0:tmpfile.rfind('.')]

if end is None:
    subprocess.call(["ffmpeg","-ss", str(start), "-i", tmpfile, "/home/thomas/Music/" + song_name + ".mp3"])
else:
    subprocess.call(["ffmpeg","-ss", str(start), "-t", str(end), "-i", tmpfile, "/home/thomas/Music/" + song_name + ".mp3"])

os.remove(tmpfile)
