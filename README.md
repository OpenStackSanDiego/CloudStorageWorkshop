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

# Object Storage Exercise

* Create bucket on Swift
* Upload file to Swift
* Download file

# Ephermeral Storage Exercise

* Review Flavors
* Boot VM
* Add extra ephmeral volume as swap

# Block Storage Exercise

* Review Volume Types
* Create Volume
* Boot VM
* Attach volumes within VM
* Terminate VMs
* Migrate volumes to an alternate VM

# Snapshot Storage

* Snapshot VM
* Boot from Snapshot



