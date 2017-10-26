## OpenStack Ephemeral Storage

Log into the OpenStack Horizon web dashboard and proceed to the compute page.

* Project->Compute->Instance

## Review the Flavors

openstack flavor list
openstack flavor show a1.tiny

### Launch Instance/Review Storage Options
Click the "Launch Instance" button
* Instance Name: web
* Source: cirros
* Flavor: a1.tiny (Review the other available flavors)
* Launch

openstack server create --flavor a1.tiny --image cirros --nic net-id=internal cirros
openstack server show cirros -f value -c addresses

### Utilize the ephemeral disk

``bash
ssh cirros@IP_ADDRESS_HERE
cat /proc/swaps
mkswap -f /dev/vdb
swapon /dev/vdb
cat /proc/swaps
``

## Wrap Up

``bash
exit
``

``
openstack server delete cirros
``

Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
