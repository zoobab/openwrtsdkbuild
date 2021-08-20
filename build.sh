#!/bin/sh
docker build --build-arg giturl=https://github.com/zoobab/openwrt_helloworld --build-arg packname=helloworld -t hellowordcpp .
