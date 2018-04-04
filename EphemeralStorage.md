## OpenStack Ephemeral Storage

## Review the Flavors

```bash
openstack flavor list
openstack flavor show a1.tiny
```

GUI: Project->Compute->Instances->Launch->Details->Flavors

### Launch an Instance

```bash
openstack server create --flavor a1.tiny --image cirros --nic net-id=internal cirros
openstack server show cirros -f value -c addresses
```

GUI: Project->Compute->Instances->Launch
* Image: CentOS 7 64 bit
* Network: Public Internet

### Utilize the ephemeral disk as Swap

* __cirros default username is cirros and password is cubswin:) or gocubsgo__
* __CentOS default username is centos__

Login via CLI or PuTTY
```bash
[user1@lab1]$ ssh cirros@IP_ADDRESS_HERE
```

```bash
$ sudo su -
# cat /proc/swaps
# fallocate -l 1M /mnt/swap
# dd if=/dev/zero of=/mnt/swap bs=1024 count=1024
# mkswap /mnt/swap
# chmod 600 /mnt/swap
# swapon /mnt/swap
# cat /proc/swaps
```

## Wrap Up

Log out of the instance. Don't delete the instance since it will be used in later exercises.

```bash
# exit
$ exit
```


Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
