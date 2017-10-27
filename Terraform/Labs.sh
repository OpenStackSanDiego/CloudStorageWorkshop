#
# one shared project with a shared network
#
source ~/keystonerc_admin

openstack flavor create --ram 512 --disk 1 --ephemeral 1 a1.tiny

STORAGE_PROJECT_ID=`openstack project create storage -f value -c id`
NETWORK_ID=`openstack network create internal --share --project $STORAGE_PROJECT_ID -f value -c id`

DNS_NAMESERVER=`grep -i nameserver /etc/resolv.conf | cut -d ' ' -f2 | head -1`
INTERNAL_SUBNET=192.168.0.0/16

SUBNET_ID=`openstack subnet create              \
        --network $NETWORK_ID                   \
        --dns-nameserver $DNS_NAMESERVER        \
        --subnet-range $INTERNAL_SUBNET         \
        --project $STORAGE_PROJECT_ID           \
        $INTERNAL_SUBNET -f value -c id`


ROUTER_ID=`openstack router create --project $STORAGE_PROJECT_ID internal-gw -f value -c id`
openstack router add subnet $ROUTER_ID $SUBNET_ID

PUBLIC_NETWORK_ID=`openstack network show public -f value -c id`
openstack router set --external-gateway $PUBLIC_NETWORK_ID $ROUTER_ID

sleep 2
# setup route from physical server to this subnet
until NET_GATEWAY=$(sudo ip netns exec qrouter-"${ROUTER_ID}" ip -4 route get 8.8.8.8 | head -n1 | awk '{print $7}')
do
  sleep 2
done
ip route replace "${INTERNAL_SUBNET}" via $NET_GATEWAY


for i in $(seq 1 3)
do

USER=user$i
USER_HOME=`eval echo "~$USER"`
PROJECT=storage$i

echo $PROJECT $USER $USER_HOME

PROJECT_ID=`openstack project create $PROJECT -f value -c id`

openstack quota set --floating-ips 1 $PROJECT
openstack quota set --instances 2 $PROJECT
openstack quota set --cores 2 $PROJECT
openstack quota set --gigabytes 6 $PROJECT
openstack quota set --snapshots 2 $PROJECT
openstack quota set --volumes 4 $PROJECT

# userXX/openstack
adduser -p 42ZTHaRqaaYvI $USER -G wheel
USER_HOME=`getent passwd $USER |  cut -f6 -d:`

cp -R ~root/.ssh $USER_HOME
chown -R $USER.$USER $USER_HOME/.ssh/
chmod 700 $USER_HOME/.ssh/

IP=`hostname -I | cut -d' ' -f 1`

# create a keystone credential file for the new user
cat >> $USER_HOME/keystonerc << EOF
unset OS_SERVICE_TOKEN
export OS_USERNAME=$USER
export OS_PASSWORD=openstack
export OS_AUTH_URL=http://$IP:5000/v3
export PS1='[\u@\h \W(keystone_$USER)]\$ '

export OS_PROJECT_NAME=$PROJECT
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_IDENTITY_API_VERSION=3
EOF

# have the keystone credentials read upon login of the new user
cat >> $USER_HOME/.bash_profile << EOF

# OpenStack
. ~/keystonerc

EOF

openstack user create --password "openstack" $USER

openstack role create $USER

openstack role add --project $PROJECT --user $USER $USER
openstack role add --project $PROJECT --user $USER _member_

SECURITY_GROUP=`openstack security group rule create --project $PROJECT default -f value -c id`
openstack security group rule create --dst-port 80 --protocol tcp --ingress --project $PROJECT default
openstack security group rule create --dst-port 22 --protocol tcp --ingress --project $PROJECT default

# sample file to use with Swift
curl -s https://raw.githubusercontent.com/OpenStackSanDiego/CloudStorageWorkshop/master/heroimage.jpeg -o $USER_HOME/heroimage.jpeg > /dev/null

done

sed -i 's/^PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd.service
