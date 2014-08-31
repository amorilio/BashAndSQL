list='10.240.216.249 10.240.216.250 10.240.216.251 10.240.216.252 10.240.216.253 10.240.216.254  10.240.217.7 10.240.217.8 10.240.217.59 10.240.217.61'

if [ $# -ne 1 ]
then 
  echo ""
  echo "Example: execCommand.sh <command>    - will run supplied command on all remote hosts"
  echo "Exiting...."
  exit 0
fi

for i in $list 
do 
   ssh demantra@$i "$1";
done