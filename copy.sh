


list='10.240.216.250 10.240.216.251 10.240.216.252 10.240.216.253 10.240.216.254  10.240.217.7 10.240.217.8 10.240.217.59 10.240.217.61'

cd ~;
rm EngPack.tar.gz; 
rm EngPack.tar;
tar cvf EngPack.tar EngPack;
gzip EngPack.tar

for i in $list
do
  echo "-------------------- Starting Prepare for host $i--------------------"
  scp EngPack.tar.gz demantra@$i:~/EngPack.tar.gz
  ssh demantra@$i "cd ~;gunzip EngPack.tar.gz;tar xvf EngPack.tar;rm EngPack.tar"
  echo "-------------------- Finished Prepare for host $i--------------------"
done