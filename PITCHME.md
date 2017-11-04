<!--- GitPitch link: https://gitpitch.com/OpenStackSanDiego/CloudStorageWorkshop --->

### OpenStack Storage Workshop

![Logo](https://github.com/OpenStackSanDiego/CloudStorageWorkshop/blob/master/heroimage.jpeg?raw=true)

---
# CloudStorageWorkshop 

* @john_studarus 
* @kylemurley


---?image=https://github.com/OpenStackSanDiego/CloudStorageWorkshop/blob/master/heroimage.jpeg?raw=true


### OpenStack Storage Workshop

OpenStack offers a variety of storage options each providing different functionality. This workshop provides a hands-on guides teaching how to use these storage services.

---

### Storage Functions

| Functionality  | Description              | OpenStack | Use Cases                                    |
| -------------- | -------------------------| ----------|--------------------------------------------- |
| Object         | Object Storage           | Swift     | web, mobile, unstructured data that grows |

---
| Functionality  | Description              | OpenStack | Use Cases                                    |
| -------------- | -------------------------| ----------|--------------------------------------------- |
| Ephemeral      | VM local                 | Nova      | root disks |


---
| Functionality  | Description              | OpenStack | Use Cases                                    |
| -------------- | -------------------------| ----------|--------------------------------------------- |
| Block          | Persistent single VM     | Cinder    | |


---
| Functionality  | Description              | OpenStack | Use Cases                                    |
| -------------- | -------------------------| ----------|--------------------------------------------- |
| VM Image       | Boot & Snapshots Images  | Glance    | pre-made VM image repository |


---
| Functionality  | Description              | OpenStack | Use Cases                                    |
| -------------- | -------------------------| ----------|--------------------------------------------- |
| File           | Shared File Systems      | Manila    | file share as a service for cloud |


---

### Workshop Exercises

* <A HREF="EphemeralStorage.md">Ephemeral Exercise</A> 
* <A HREF="BlockStorage.md">Block and Snapshot Exercise</A>  
* <A HREF="ObjectStorage.md">Object Exercise</A>

---

### Challenge

Once you've walked through the three exercises above, tackle the challenges below!

* Create a virtual machine with:
* Swap on ephemeral disk
* One volume 1GB (min 5000 IOPS) mounted as /var/www/html
* One volume 1GB (least expensive) mounted as /mnt/backups
* One volume 1GB (encrypted) mounted as /mnt/secrets

---

### Expert Challenge

* Create a virtual machine with:
* Web server installed on the virtual machines
* Serve "index.html" that includes an embedded image (IMG SRC) to an image on Swift
* The system needs to be accessible from the Internet on port 80
* Include your name/handle, lab #, and user account # in the index.html page
* Tweet us the URL with the tag "@OpenStackSanDiego"

---

