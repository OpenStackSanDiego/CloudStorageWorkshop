## OpenStack Block Storage

### Volume Types Available

```bash
openstack volume type list
openstack volume type show Gold
```

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
ls /var/www/
cat /var/www/index.html
umount /var/www
exit
```

### Deallocate the Volume from the Virtual Machine

```bash
openstack server remove volume cirros webfiles
```

### Snapshot and Delete the Virtual Machine

```bash
openstack snapshot ... cirros-snapshot
openstack server delete cirros
```


### Create a replacement Virtual Machine from the Snapshot

```bash
openstack server create ... cirros2
```

### Move the volume to a second instance


```bash
openstack server list
openstack volume list
openstack server add volume cirros2 webfiles
```

### Mount the volume on the second instance

```bash
openstack server list
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

Congrats! You accomplished some basic block and snapshot actions!

Log out of the Cirros instance.

Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
