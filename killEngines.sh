ps -ef | grep "./Engine "  | grep -v grep | awk '{print $2}' | xargs kill -9



list='10.240.216.250 10.240.216.251 10.240.216.252 10.240.216.253 10.240.216.254  10.240.217.7 10.240.217.8 10.240.217.59 10.240.217.61'

for i in $list
do
  ssh demantra@$i "ps -ef | grep "./Engine "  | grep -v grep | awk '{print \$2}' | xargs kill -9"
done