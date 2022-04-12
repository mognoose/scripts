#!/bin/bash

if [ -z "$1" ]; then
  IP=$(curl -s icanhazip.com);
else
  IP=$1
fi

CITY=$(curl -s ipinfo.io/$IP/city)

echo $CITY
