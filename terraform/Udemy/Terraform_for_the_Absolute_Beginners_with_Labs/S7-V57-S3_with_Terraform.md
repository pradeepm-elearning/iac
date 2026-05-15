S3 WITH TERRAFORM

Create S3 Bucket using Terraform

main.tf

resource "aws_s3_bucket" "mytfbuckettest" {
    bucket = "mytfautobuckettest"
    tags = {
        Description = "My TF Auto Bucket Test"
    }
}


To Upload Files into the S3 Bucket.

resource "aws_s3_bucket_object" "test_file" {
    content = "/home/ciuser/terraform_practice/s3-bucket/dogs.txt"
    key = "dogs.txt"
    bucket = "aws_s3_bucket.mytfbuckettest.id"
}
