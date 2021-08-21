#!/bin/sh

if [ $# -ne 6 ]; then
  echo "Usage: $0 giturl packname imagename arch subarch relver"
  echo "Example: $0 https://github.com/zoobab/openwrt_helloworld helloworld helloworldcpp x86 64 21.02.0-rc4" 
  exit 1
fi

giturl="$1"
packname="$2"
imagename="$3"
arch="$4"
subarch="$5"
relver="$6"

docker build --no-cache --build-arg giturl="$giturl" --build-arg packname="$packname" --build-arg arch="$arch" --build-arg subarch="$subarch" --build-arg relver="$relver" -t "$imagename:$relver-$arch-$subarch" .
