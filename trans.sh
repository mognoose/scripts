#!/bin/bash

if [ $1 ]
then
  req=$1
else
  req=$(xclip -o)
fi
res=$(trans -brief -t fi -j $req)
echo $res