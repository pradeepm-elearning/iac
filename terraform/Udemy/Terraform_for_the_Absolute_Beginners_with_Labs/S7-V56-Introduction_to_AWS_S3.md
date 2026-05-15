INTRODUCTION TO AWS S3

Its a object storing unit.
It can be used store any data file.

Each files or folders are considered as an object.

Consideration to be followed while creating a S3 Bucket.
1. Bucket name must be unique.
2. Name should be DNS compliant. Which means no uppercase, underscores are available.
3. File size should be between 0 to 5TB

S3 bucket can be accessed using the below URL.
https://<bucket_name>.<region>.amazonaws.com

Objects inside the buckets can be accessed using the below URL.
https://<bucket_name>.<region>.amazonaws.com/<folder_name>/<filename>

Any object in a S3 bucket consists of 2 things.
1. Object Data
     Key = filename
     Value = Data
2. Meta Data
     Owner = Pradeep
     Size = 10 MB
     Last Modified = <DATE>

Nobody can access the Object of the S3 Bucket with the exception of the Bucket Owner.

Access to the bucket and the objects are governed by Bucket policies and Access Control List.
Bucket policies - they are the permission that are granted at the Bucket Level.
Access Control Lists - they are used to define at an object level.

