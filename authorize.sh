
list='10.240.216.250 10.240.216.251 10.240.216.252 10.240.216.253 10.240.216.254  10.240.217.7 10.240.217.8 10.240.217.59 10.240.217.61'

# hit enter on each question to avoid setting the password
ssh-keygen -t rsa


for i in $list
do
  #answer 'yes' to add to known hosts and 
  cat ~/.ssh/id_rsa.pub | ssh demantra@$i 'cat >> .ssh/authorized_keys'
done
