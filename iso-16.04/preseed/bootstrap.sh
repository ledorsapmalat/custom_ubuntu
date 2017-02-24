HOSTNAME=`ip route get 8.8.8.8 | awk '{print $NF; exit}'`
HOSTNAME=`echo  ${HOSTNAME//./-}`
HOSTNAME=$1-$HOSTNAME
sudo sed -i -e "s/HELIXSOFTWARE/`echo $HOSTNAME`/g" /etc/chef/client.rb 

sudo chef-client -j /etc/chef/file.json -E $1
