#!/bin/bash

#
# run60Engines.sh
#
# start Fusion engines in loop
#

start=1
step=6
((end = start+step-1))

cd ~/EngPack;
echo "----------------------------------- Running Engines on localhost, branch $start to $end -----------------------------------------"
./runEngineLoop.sh $start $end 

list='10.240.216.250 10.240.216.251 10.240.216.252 10.240.216.253 10.240.216.254  10.240.217.7 10.240.217.8 10.240.217.59 10.240.217.61'

for i in $list
do
  (( start = end+1 ))
  (( end = start+step-1))
  echo "----------------------------------- Running Engines on $i, branch $start to $end -----------------------------------------"
  ssh demantra@$i "cd ~/EngPack; nohup ./runEngineLoop.sh $start $end 1>&2 "  
done
