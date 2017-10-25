yum install -y centos-release-openstack-ocata
#yum install -y centos-release-openstack-pike
yum update -y
yum install -y openstack-packstack

time packstack                                  \
        --allinone                              \
        --os-ceilometer-install=n               \
        --os-neutron-ml2-type-drivers=flat,vxlan \
	--os-cinder-install=y                   \
	--os-manila-install=y                   \
        --os-heat-install=y

yum -y install openstack-manila-ui

yum -y update
echo "*** End of base OpenStack cloud install"


# easy modification of .ini configuration files
yum install -y crudini
