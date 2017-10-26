## OpenStack Block Storage

### Create Volume
* Click "Create Volume+"
* Name this new volume "web files"
* Click "Create Volume"

### Add the Volume to the Instance
* On the Compute page, from the instance drop down, select "Attach Volume" and select "web files"

### Log In

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

Log out of the Cirros instance.

Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
