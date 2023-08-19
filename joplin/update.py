import subprocess
import os

stdout = subprocess.run(["curl", "https://github.com/laurent22/joplin/releases/latest"], capture_output=True).stdout.decode("ascii")
version = stdout[stdout.find("tag") + 5:]
version = version[:version.find('"')]
file_name = f"Joplin-{version}.AppImage"

download_url = f"https://github.com/laurent22/joplin/releases/download/v{version}/{file_name}"
subprocess.run(["wget", download_url])

subprocess.run(["chmod", "775", file_name])

crdir = os.getcwd()
os.rename(f"{crdir}/{file_name}", "/home/tk/bin/joplin")
