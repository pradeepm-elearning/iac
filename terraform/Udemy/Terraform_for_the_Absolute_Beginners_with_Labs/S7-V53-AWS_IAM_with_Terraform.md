AWS IAM WITH TERRAFORM

aws_iam_user

Syntax:

resource "aws_iam_user" "admin-user" {
    name = test
    tags = {
        Description = "Technical Team Lead"
    }
}

We get an error when we run `terraform plan` command as the aws region and valid credentials has not been provided.

main.tf

provider "aws" {
    region = "ap-south-2"
    access_key = "AWSACCESSKEYIDACCOUNT"
    secret_key = "AbCd1234$*/#zyxw9876"
}

resource "aws_iam_user" "admin-user" {
    name = test
    tags = {
        Description = "Technical Team Lead"
    }
}

Hard coding the access_key and secret_key is very risky and not recommended.

There are 2 ways to solve this problem.
1. Add the required Access Key and Secret Access Key in the `.aws/credentials` file present in Home Directory.
2. To create Environmental Variable using
    export AWS_ACCESS_KEY_ID = AWSACCESSKEYIDACCOUNT
    export AWS_SECRET_ACCESS_KEY_ID = AbCd1234$*/#zyxw9876