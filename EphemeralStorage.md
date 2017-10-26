## OpenStack Ephemeral Storage

## Review the Flavors

```bash
openstack flavor list
openstack flavor show a1.tiny
```

### Launch an Instance

```bash
openstack server create --flavor a1.tiny --image cirros --nic net-id=internal cirros
openstack server show cirros -f value -c addresses
```

### Utilize the ephemeral disk as Swap

```bash
ssh cirros@IP_ADDRESS_HERE
sudo su -
cat /proc/swaps
mkswap -f /dev/vdb
swapon /dev/vdb
cat /proc/swaps
```

## Wrap Up

```bash
exit
```

```bash
openstack server delete cirros
```

Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
