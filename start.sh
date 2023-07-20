#!/bin/sh
if [ ! -f /smartdns/smartdns.conf ]; then
    mkdir -p /smartdns
    mv config.conf /smartdns/smartdns.conf    
fi
/bin/smartdns -f -x -c /smartdns/smartdns.conf