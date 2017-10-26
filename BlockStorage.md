## OpenStack Block Storage

### Volume Types Available

openstack volume type list
openstavk volume type show Gold

### Create Volume

```bash
openstack volume create --size 1 --type Gold webfiles
```

### Add the Volume to the Instance

```bash
openstack server add volume --device /dev/vdc cirros webfiles
```
* On the Compute page, from the instance drop down, select "Attach Volume" and select "web files"


### Utilize the Volume
* Become superuser (root)
* Examine disks
* Mount the volume
* Add a file
* Unmount the volume

```
openstack server list
ssh cirros@CIRROS_IP_ADDR_HERE
sudo su -
fdisk -l
mkdir /var/www/
mkfs -t ext4 -L webfiles /dev/vdc
blkid
mount /dev/vdc /var/www/
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

```bash
openstack server remove volume cirros webfiles
openstack server delete cirros
openstack server create --flavor a1.tiny --image cirros --nic net-id=internal cirros2
openstack server add volume cirros2 
openstack server list
```

```bash
ssh cirros@CIRROS2_IP_ADDR_HERE
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

Log out of the Cirros instance.

Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
