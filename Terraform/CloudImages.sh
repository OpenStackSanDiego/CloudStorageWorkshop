source keystonerc_admin

# install some OS images

IMG_URL=http://download.cirros-cloud.net/0.3.5/cirros-0.3.5-x86_64-disk.img
IMG_NAME=Cirros
OS_DISTRO=cirros
wget -q -O - $IMG_URL | \
glance  --os-image-api-version 2 image-create --name $IMG_NAME \
        --visibility public --disk-format raw --container-format bare --property os_distro=$OS_DISTRO --progress

IMG_URL=https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2
IMG_NAME=CentOS-7
OS_DISTRO=centos
wget -q -O - $IMG_URL | \
glance  --os-image-api-version 2 image-create --name $IMG_NAME \
        --visibility public --disk-format raw --container-format bare --property os_distro=$OS_DISTRO --progress
