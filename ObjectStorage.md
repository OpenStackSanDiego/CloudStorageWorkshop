## OpenStack Swift Walk Through

Log into the OpenStack Horizon web dashboard and proceed to the object storage page. Use the OpenStack lab URL and username/password provided.

* Object Store->Container

### Create Bucket
* "+ Container"
* Name the container 'images'
* Mark container "Public"

### Upload Data

Log into the OpenStack lab via SSH using the lab and username/password provided.

```bash
openstack container list
openstack container show images
openstack object create images heroimage.jpeg
```

### Download Data
* Return to the web page
* Click the file to download

## Wrap Up

Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
