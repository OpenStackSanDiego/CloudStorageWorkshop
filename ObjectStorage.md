

## Overview



## Amazon S3

Amazon Simple Storage Service is storage for the Internet. It is designed to make web-scale computing easier for developers. Amazon S3 has a simple web services interface that you can use to store and retrieve any amount of data, at any time, from anywhere on the web.

https://s3.amazonaws.com/openstacksandiego/IMG_20161023_011414384_HDR.jpg

* s3.amazonaws.com (server/cloud)
* openstacksandiego (bucket name)
* IMG_20161023_011414384_HDR.jpg (file name)

## OpenStack Swift

The OpenStack Object Store project, known as Swift, offers cloud storage software so that you can store and retrieve lots of data with a simple API. It's built for scale and optimized for durability, availability, and concurrency across the entire data set.

Sample URL:
http://blue.openstacksandiego.org:8080/v1/AUTH_4f7a03952f6c42b9a818c7263cfbc461/web/IMG_20161023_011536695.jpg

* blue.openstacksandiego.org (server/cloud)
* web (container name)
* IMG_20161023_011536695.jpg (file name)


## Amazon S3 Walk Through

Log into the AWS S3 console at:

* https://s3.console.aws.amazon.com/s3/home?region=us-east-1

### Create Bucket
* "+ Create Bucket"
* Enter new bucket name (i.e. openstacksandiego-bucket)
* Set permission as "Public"

### Upload Data
* Select the new container
* Click the "upload" button
* Pick a file and upload

### Download Data
* Click the filename to download

## OpenStack Swift Walk Through

Log into the OpenStack Horizon web dashboard and proceed to the object storage page.

* Object Store->Container

### Create Bucket
* "+ Container"
* Enter new container name (i.e. web)
* Mark container "Public"

### Upload Data
* Select the new container
* Click the "upload" button to right of search box
* Pick a file and upload

### Download Data
* Click the file to download

## Wrap Up

Once you're done, return back to the <A HREF="../master/README.md">main page</A> for the next type of storage!
