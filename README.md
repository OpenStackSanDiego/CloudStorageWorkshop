# OpenStack Storage Workshop

Workshop overview and goals...

# Storage Functions

| Functionality  | Description              | OpenStack | Use Cases                                    |
| -------------- | -------------------------| ----------|--------------------------------------------- |
| Object         | Object Storage           | Swift     | |
| Ephemeral      | VM local                 | Nova      | |
| Block          | Persistent single VM     | Cinder    | |
| VM Image       | Boot & Snapshots Images  | Glance    | |
| File           | Shared File Systems      | Manila    | |

# Workshop Exercises

<A HREF="ObjectStorage.md">Object Lab</A> 
<A HREF="EphemeralStorage.md">Ephemeral Lab</A>
<A HREF="BlockStorage.md">Block Lab</A>  

# Challenge

Once you've walked through the three exercises above, you're welcome to tackle the challenges below!

* Create a a1.tiny Cirros virtual machine with:
* Swap on ephemeral disk
* One 'Gold' type volume 1GB mounted as /var/www/html
* One 'Bronze' type volume 1GB mounted as /mnt/backups

# Expert Challenge

* Create a virtual machine some sort of web server running on it
* Serve "index.html" that includes an embedded image (IMG SRC) to an image on Swift
* The system needs to be accessible from the Internet on port 80
* Include your name/handle, lab #, and user account # in the index.html page
* Tweet or email us the URL



