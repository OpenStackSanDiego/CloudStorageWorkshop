## OpenStack Block Storage

### Volume Types Available

```bash
[user1@lab1]$ openstack volume type list
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

### Utilize the Volume

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
[user1@lab1]$ openstack server image create --name cirros-snapshot cirros
[user1@lab1]$ openstack image list
[user1@lab1]$ openstack image show cirros-snapshot
[user1@lab1]$ openstack server delete cirros
[user1@lab1]$ openstack server list
```


### Create a replacement Virtual Machine from the Snapshot

```bash
[user1@lab1]$ openstack server create --flavor a1.tiny --image cirros-snapshot --nic net-id=internal cirros2
```

### Move the volume to a second instance


```bash
[user1@lab1]$ openstack server list
[user1@lab1]$ openstack volume list
[user1@lab1]$ openstack server add volume cirros2 webfiles
[user1@lab1]$ openstack volume list
```

### Mount the volume on the second instance

```bash
[user1@lab1]$ openstack server list
[user1@lab1]$ ssh cirros@CIRROS2_IP_ADDR_HERE
$ sudo su -
# ls /var/www
# blkid
# mount /dev/vdc /var/www/
# df
# ls /var/www
# cat /var/www/index.html
# exit
$ exit
```

### Clean Up

```
[user1@lab1]$ openstack volume delete webfiles
[user1@lab1]$ openstack server delete cirros2
[user1@lab1]$ openstack image delete cirros-snapshot

## Wrap Up

Congrats! You accomplished some basic block storage and snapshot actions!

Be sure to log out of the cirros image and destroy the volume, snapshot and virtual machines.

Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
