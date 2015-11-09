#!/bin/sh

# Prerequisites
apt-get install sqlite3 git

# Get the latest Seafile release
ver=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/gogits/gogs/releases/latest)

# Only keep the version number in the url
ver=$(echo $ver | awk '{ver=substr($0, 46); print ver;}')

if ARCH=86
  then arch=386
else
  arch=ARCH
fi
wget https://github.com/gogits/gogs/releases/download/v$ver/linux_$ARCH.zip
unzip linux_$arch.zip
rm linux_$arch.zip

./gogs web

whiptail --msgbox "Gogs successfully installed!

Open http://your_hostname.com:3000 in your browser." 16 60