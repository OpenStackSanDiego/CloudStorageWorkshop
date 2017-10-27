## OpenStack Swift Walk Through

Log into the OpenStack Horizon web dashboard and proceed to the object storage page. Use the OpenStack lab URL and username/password provided.

* Object Store->Container

### Create Bucket

Use the Horizon dashboard to create a new object storage bucket with public access.

* "+ Container"
* Name the container 'images'
* Mark container "Public"

### Upload Data

Log into the OpenStack lab via SSH using the lab and username/password provided. Add a file into the container.

```bash
[user1@lab1]$ openstack container list
[user1@lab1]$ openstack container show images
[user1@lab1]$ openstack object create images heroimage.jpeg
```

### Download Data

With the sample file uploaded, via the dashboard, verify that the file can be downloaded OK.

* Return to the Horizon dashboard
* Download the sample file

### Retrieve the URL

```bash
[user1@lab1]$ openstack container show images
```
http://LAB_URL:8080/v1/ACCOUNT_NUMBER/CONTAINER_NAME/FILE_NAME

http://147.75.107.114:8080/v1/AUTH_73768068a66d4c31b1ad1d4dd067fb78/images/Grit.jpg

## Wrap Up

Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
