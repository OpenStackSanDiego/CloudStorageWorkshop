## OpenStack Swift Walk Through

Log into the OpenStack Horizon web dashboard and proceed to the object storage page. Use the OpenStack lab URL and username/password provided.

* Object Store->Container

### Create Bucket

Use the Horizon dashboard to create a new object storage bucket with public access.

```bash
[user1@lab1]$ openstack container create images
[user1@lab1]$ swift post --read-acl .r:*,.rlistings images
```

### Upload Data

There's a default file heroimage.jpeg available to be uploaded into Swift.

```bash
[user1@lab1]$ openstack container list
[user1@lab1]$ openstack container show images
[user1@lab1]$ openstack object create images heroimage.jpeg
```

### Retrieve the URL

Using the CLI, retrieve the account number and use it to create a link to the file.

* Retrieve the account id for the container 
```bash
[user1@lab1]$ openstack container show images -f value -c account
```

Build the URL using the format below:

http://LAB_URL:8080/v1/ACCOUNT_NUMBER/CONTAINER_NAME/FILE_NAME

Here's a sample URL:

http://lab1.storage.openstacksandiego.us:8080/v1/AUTH_73768068a66d4c31b1ad1d4dd067fb78/images/heroimage.jpeg

## Wrap Up

Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
