#!/bin/bash

#
# runEngine.sh
#
# start Fusion engines 
#

DB_HOST=10.240.216.35
PORT=1521
SERVICE=dbm
USERNAME=sprint1
PASSWORD=demantra1

PLAN_ID=0
PROFILE_ID=300100010946731
REQUEST_ID=1
IS_REVCOVERY=0

if [ $# -ne 1 ]
then 
  echo ""
  echo "Please supply the branch number for engine. "
  echo "Example: runEngine.sh 6    - will run branche 6"
  echo "Exiting...."
  exit 0
fi

#check Engine Executable exists and is executable
if [ ! -f Engine ]
then 
	echo "Can not find Engine Executable. Exiting..."; 
	exit 
fi

if [ ! -x Engine ]
then 
	echo "Engine Executable has no executable permissions. Exiting..."; 
	exit 
fi

#check XML directories
if [ ! -d xml ]
then 
	echo "Can not find xml directory. Exiting..."; 
	exit 
fi

#check required libraries
if [ 	! -f libclntsh.so.11.1 -o ! -f libocci.so.11.1 -o ! -f libnnz11.so -o ! -f libociei.so -o ! -f libttclassesCS.so -o ! -f libttclient.so -o ! -f libttco.so -o ! -f libMatlabCoder.so -o ! -f libMFLWrapper.so -o ! -f libAnalyticalEng.so -o ! -f libStringEncoder.so -o ! -f libxerces-c-3.1.so -o ! -f libdms2.so -o ! -f libons.so -o ! -f libatgpf.so -o ! -f libdmsapp.so  ]
then 
	echo "One of following shared libraries , required by engine is missing.";
	echo "libclntsh.so.11.1 libocci.so.11.1 libnnz11.so libociei.so libttclassesCS.so libttclient.so libttco.so libMatlabCoder.so libMFLWrapper.so libAnalyticalEng.so libStringEncoder.so libxerces-c-3.1.so libdms2.so libons.so libatgpf.so libdmsapp.so";
	echo "Exiting..."; 
	exit 
fi

unset ENGINE_ROOT
echo $ENGINE_ROOT

unset ORACLE_HOME
echo $ORACLE_HOME

export LD_LIBRARY_PATH=`pwd`:$LD_LIBRARY_PATH;
echo $LD_LIBRARY_PATH

((ENGINE_ID = $1 - 1))
echo "Executing Engine Branch $1: ./Engine $ENGINE_ID -oracle $DB_HOST:$PORT/$SERVICE $USERNAME $PASSWORD $PLAN_ID $PROFILE_ID $REQUEST_ID $1 $IS_REVCOVERY"
./Engine $ENGINE_ID -oracle $DB_HOST:$PORT/$SERVICE $USERNAME $PASSWORD $PLAN_ID $PROFILE_ID $REQUEST_ID $1 $IS_REVCOVERY 
