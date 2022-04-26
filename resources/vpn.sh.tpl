#!/bin/bash

docker run --restart always --name shadowsocks -e PASSWORD=${password} -e METHOD=aes-256-gcm -p ${port}:8388 -p ${port}:8388/udp -d shadowsocks/shadowsocks-libev