#!/bin/bash

#
# runEngineInLoop.sh
#
# start Fusion engines in loop
#

if [ $# -ne 2 ]
then 
  echo ""
  echo "Please supply the number of engines min and max branch numbers for loop. "
  echo "Example: runEngineInLoop.sh 1 6    - will run branches 1, 2, 3, 4, 5, 6"
  echo "Example: runEngineInLoop.sh 32 34  - will run branches 32, 33 ,34"
  echo "Exiting...."
  exit 0
fi

if [ $1 -lt 1 -o $1 -gt $2 ]
then
        echo ""
        echo "Invalid min or max branch numbers were supplied."
        echo "Example: runEngineInLoop.sh 1 6    - will run branches 1, 2, 3, 4, 5, 6"
        echo "Example: runEngineInLoop.sh 32 34  - will run branches 32, 33 ,34"
        echo "Exiting...."
        exit 0
fi

i=$1
while [[ $i -le $2 ]]
do
  ./runEngine.sh $i &
  ((i = i + 1))
  sleep 2
done
