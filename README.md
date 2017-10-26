# OpenStack Storage Workshop

Workshop overview and goals...

# Storage Functions

| Functionality  | Description              | AWS                           | OpenStack | Lab Link                                       |
| -------------- | -------------------------| ----------------------------- | --------- | ---------------------------------------------- |
| Object         | Object Storage           | S3                            | Swift     |<A HREF="ObjectStorage.md">Object Lab</A>       |
| Ephemeral      | VM local                 | Elastic Computing (E2)        | Nova      |<A HREF="EphemeralStorage.md">Ephemeral Lab</A> |
| Block          | Persistent single VM     | Elastic Block Storage (EBS)   | Cinder    |<A HREF="BlockStorage.md">Block Lab</A>         |
| VM Image       | Boot & Snapshots Images  | S3                            | Glance    |  |
| File           | Shared File Systems      | Elastic File Storage (EFS)    | Manila    |  |


# Challenge

Create a virtual machine with:

* Swap on ephemeral disk
* One 'Gold' type volume as /var/www/html
* One 'Bronze' type volume as /mnt/backups

# Ultimate Challenge

* Run a webserver on the virtual machine
* Serve "index.html" that includes an embedded image (IMG SRC) to an image on Swift
* Include your name/handle, lab #, and user account # in the index.html page
* Tweet or email us the URL



