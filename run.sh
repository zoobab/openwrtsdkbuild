#!/bin/sh

if [ $# -ne 1 ]; then
  echo "Usage: $0 imagename"
  echo "Example: $0 helloworldcpp"
  exit 1
fi

imagename="$1"

docker run -d -p 8000:8000 $imagename
