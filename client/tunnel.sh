#!/bin/bash

# for rust implementation
./sslocal --protocol tunnel -b "0.0.0.0:<LOCAL_PORT>" -f "<FORWARD_ADDRESS>:<FORWARD_PORT>" -s "<SHADOWSOCKS_SERVER_PUBLIC_IP>:<SHADOWSOCKS_PORT>" -m "chacha20-ietf-poly1305" -k "<SECRET_PASSWORD>" -U --timeout 300
