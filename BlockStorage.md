## OpenStack Block Storage

### Volume Types Available

```bash
[user1@lab1]$ openstack server listopenstack volume type list
[user1@lab1]$ openstack volume type show Gold
```

### Create Volume

```bash
[user1@lab1]$ openstack volume create --size 1 --type Gold webfiles
```

### Add the Volume to the Instance

```bash
[user1@lab1]$ openstack server add volume --device /dev/vdc cirros webfiles
```
* On the Compute page, from the instance drop down, select "Attach Volume" and select "web files"


### Utilize the Volume
* Become superuser (root)
* Examine disks
* Mount the volume
* Add a file
* Unmount the volume

```
[user1@lab1]$ openstack server list
[user1@lab1]$ ssh cirros@CIRROS_IP_ADDR_HERE
$ sudo su -
# fdisk -l
# mkdir /var/www/
# mkfs -t ext4 -L webfiles /dev/vdc
# blkid
# mount /dev/vdc /var/www/
# df
# ls /var/www
# echo "hello world" > /var/www/index.html
# ls /var/www/
# cat /var/www/index.html
# umount /var/www
# exit
$ exit
```

### Deallocate the Volume from the Virtual Machine

```bash
[user1@lab1]$ openstack server remove volume cirros webfiles
[user1@lab1]$ openstack server list
[user1@lab1]$ openstack volume list
```

### Snapshot and Delete the Virtual Machine

```bash
openstack server image create --name cirros-snapshot cirros
openstack image list
openstack image show cirros-snapshot
openstack server delete cirros
openstack server list
```


### Create a replacement Virtual Machine from the Snapshot

```bash
openstack server create --flavor a1.tiny --image cirros-snapshot --nic net-id=internal cirros2
```

### Move the volume to a second instance


```bash
openstack server list
openstack volume list
openstack server add volume cirros2 webfiles
openstack volume list
```

### Mount the volume on the second instance

```bash
openstack server list
ssh cirros@CIRROS2_IP_ADDR_HERE
sudo su -
ls /var/www
blkid
mount /dev/vdc /var/www/
df
ls /var/www
cat /var/www/index.html
```

## Wrap Up

Congrats! You accomplished some basic block storage and snapshot actions!

Be sure to log out of the cirros image and destroy the volume, snapshot and virtual machines.

Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
