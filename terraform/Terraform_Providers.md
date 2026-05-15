TERRAFORM PROVIDERS

1. local_file
    filename
    content
    file_permission
    directory_permission
    lifecycle {
        create_before_destroy = <boolean>
        prevent_destroy = <boolean>
        ignore_changes = [content,file_permission,all]
    }

2. random_pet
    prefix
    separator
    length
    id

3. random_uuid

4. random_integer
    min
    max

5. tls_private_key
    algorithm
    rsa_bits
    ecdsa_curve

6. tls_cert_request
    private_key_pem
    subject
        common_name
        organization

7. aws_iam_user
    name
    tags

8. aws_iam_policy
    name
    policy

9. aws_iam_user_policy_attachment
       user
    policy_arn

10. aws_s3_bucket
        bucket
        tags

11. aws_s3_bucket_object
        content
        key
        bucket

12. aws_security_group

16. provider "PROVIDER_NAME" {
        region = "STRING"
        alias = "STRING" # If we want to use 2 similar providers in the provider.tf file.
}

13. aws_instance
        ami = "STRING
        instance_type = "STRING"
        tags = "STRING"
        user_data = "STRING"
        count = NUMBER
        enabled = BOOLEAN
        vpc_security_group_ids = ["LIST"]
        provider = PROVIDER_NAME.ALIAS

14. null_resource
        provisioner {
            command = MESSAGE
        }

15. github_repository
        name
        description
        visibility

