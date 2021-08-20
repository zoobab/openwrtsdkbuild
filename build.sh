#!/bin/sh

if [ $# -ne 3 ]; then
  echo "Usage: $0 giturl packname imagename"
  echo "Example: $0 https://github.com/zoobab/openwrt_helloworld helloworld helloworldcpp"
  exit 1
fi

giturl="$1"
packname="$2"
imagename="$3"

docker build --no-cache --build-arg giturl="$giturl" --build-arg packname="$packname" -t "$imagename" .
