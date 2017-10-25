


## Overview





## Amazon Elastic Block Storage Walk Through

Log into the AWS EC2 console at:

* https://console.aws.amazon.com/ec2

Click over to the Elastic Block Storage page:

* Elastic Block Storage->Volumes

### Create Volume
* Click the "Create Volume"
* Click the "Select" Amazon Linux button
* Name this new volume "web files"
* Note the availability zone

### Start an Instance
* Start a new Amazon Linux t2.micro with an EBS volume (Add Storage->Add Volume)
* This instance needs to be in the same availability zone as the volume
* Note the new instance name

### Add the Volume to the Instance
* On the EBS page, associate the "web files" volume with the instance

### Terminate the Instance
* On the EC2 page, terminate the instance
* The volumes will contine to exist

## Clean Up
* Make sure to terminate and delete all the volumes otherwise charges will accrue!




## OpenStack Nova Walkthough

Log into the OpenStack Horizon web dashboard and proceed to the compute page.

* Project->Compute->Volumes

### Create Volume
* Click "Create Volume+"
* Name this new volume "web files"
* Click "Create Volume"

### Start an Instance
Click the "Launch Instance" button
* Instance Name: web
* Source: CirrosWeb
* Flavor: m1.tiny
* Launch

### Add the Volume to the Instance
* On the Compute page, from the instance drop down, select "Attach Volume" and select "web files"

### Log In
* Click "Associate Floating IP" and allocate/add an external IP address
* Run PuTTY/SSH and login to assigned floating IP as admin/openstack

### Utilize the volume
* Become superuser (root)
* Examine disks
* Mount the volume
* Add a file
* Unmount the volume

```
sudo su -
fdisk -l
mkdir /var/www/
mkfs -t ext4 -L www /dev/vdb
blkid
mount /dev/vdb /var/www/
df
ls /var/www
echo "hello world" > /var/www/index.html
cat /var/www/index.html
umount /var/www
```


### Move the volume to a second instance
* Terminate the first instance
* Start a new instance
* Associate the volume with the new instance
* Login and mount the disk
* Do NOT create a new file system (that will erase the existing files)
* Check that the file create from the first instance exists

```
sudo su -
fdisk -l
mkdir /var/www/
blkid
mount /dev/vdb /var/www/
df
ls /var/www
cat /var/www/index.html
```

## Wrap Up

Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
