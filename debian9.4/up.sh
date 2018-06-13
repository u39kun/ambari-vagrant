#!/usr/bin/env bash

for i in `seq -f '%02g' 1 $1`;
do
  vagrant up d94$i
done
