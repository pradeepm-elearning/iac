IAM POLICIES WITH TERRAFORM

aws_iam_policy

main.tf 

resource "aws_iam_user" "admin-user" {
    name = "deleteme"
    tags = {
        Description = "Technical Team Leader"
    }
}

resource "aws_iam_policy" "adminUser" {
    name = "AdminUsers"
    policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
    }
    EOF
}

Using a Heredoc Syntax, we can add the Policies in the policy section.


We need to attach the user to the aws_iam_policy. To attach the user to aws_iam_policy, we can use the below command.


aws_iam_user_policy_attachment : this resource expects the username to attach the policy to and the policy arn which is an attribute exported by the AWS IAM policy resource.

main.tf

main.tf 

resource "aws_iam_user" "admin-user" {
    name = "deleteme"
    tags = {
        Description = "Technical Team Leader"
    }
}

resource "aws_iam_policy" "adminUser" {
    name = "AdminUsers"
    policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
    }
    EOF
}

resource "aws_iam_user_policy_attachment" "deleteme-admin-access" {
    user = aws_iam_user.admin-user.name
    policy_arn = aws_iam_policy.adminUser.arn
}


METHOD-2:

Instead of specifying the complete JSON File within the main.tf file, we use the separate JSON File that can be stored within the configuration directory and be read within the resource block.

admin-policy.json

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}

main.tf

resource "aws_iam_user" "admin-user" {
    name = "deleteme"
    tags = {
        Description = "Technical Team Leader"
    }
}

resource "aws_iam_policy" "adminUsers" {
    name = "adminUsers"
    policy = file(admin-policy.json)
}

resource "aws_iam_user_policy_attachment" "deleteme-admin-access" {
    user = aws_iam_user.admin-user.name
    policy_arn = aws_iam_policy.adminUsers.arn
}
