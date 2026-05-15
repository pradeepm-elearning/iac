LIFECYCLES RULES

As Terraform is an immutable Infrastructure, by default, any changes done to the configuration file, the resource would be deleted first and the new resource would be created after.
There are some cases where this approach is not recommended. Hence, `lifecycle` approach would be best suited.
In the `lifecycle` approach, you can either update resource first and then delete the older resource or not delete the resources.

`create_before_destroy` : This rule ensures that when a change in configuration forces the resource to be recreated, a new resouce is created first before deleting the old one.

syntax of resource block with lifecycle rule.

main.tf

resource "local_file" "pets" {
    filename = "/root/pets.txt"
    content = "I love pets"
    file_permission = 0700
    lifecycle {
        create_before_destroy = true
    }
}



prevent_destroy : this would not destroy any resource. It useful to prevent your resources from getting accidentally deleted.

syntax of resource block with lifecycle rule.

main.tf

resource "local_file" "pets" {
    filename = "/root/pets.txt"
    content = "I love pets"
    file_permission = 0700
    lifecycle {
        prevent_destroy = true
    }
}

This approach is best suited for MySQL, PostgreSQL Databases.
Using `terraform destroy` would still destroy the resouces.
This rule will only prevent resource deletion from changes that are made to the configuration and a subsequent apply.


ignore_changes : will prevent a resource from being updated based on a list of attributes that we define within the life cycle block.

main.tf

resource "aws_instance" "webserver" {
    ami = "ami-0edab43b6fa892279"
    instance_type = "t2.micro"
    tags = {
        Name = "ProjectA-Webserver"
    }
    lifecycle {
        ignore_changes = [tags]
    }
 }

eg: let's make use of a sample EC2 instance, which is a virtual machine on the AWS cloud.
This EC2 instance is to be used as a web server and can be created with a simple resource block.
Please note that the resource called Web server makes use of three arguments. The "ami" and the "instance type" are used to deploy a specific type of VM with a predefined specification.
The values that we have chosen, deploys an Ubuntu server with 1 CPU and 1 GB of RAM.
We are also making use of a tag called "Name", which has a value of "ProjectA-Webserver" using the tags argument which is of type map.
When we run TerraForm apply, The EC2 instance is created as expected with a tag called "Name" and a value of "ProjectA-Webserver".
Now, if changes are made to any of these arguments, TerraForm will attempt to fix it during the next apply as expected.
For example, if we modify the tag called name and change its value from "ProjectA-Webserver" to "ProjectB-Webserver" either manually or using any other tool, Terraform will detect this change and it will attempt to change it back to what it was originally, which is "ProjectA-Webserver".
In some rare cases, we may actually want the change in the name while any other method to be acceptable and we want to prevent their form from reverting back to the old tag.
To do this, we can make use of the "lifecycle" block with "ignore_changes" argument.
The ignore changes argument accepts a list as indicated by the square brackets and it will accept any valid resource attribute.
Terraform ignores the changes which are made to the tags attribute of the specific EC2 instance.
If a change is made to the tags, a subsequent terraform apply should now show that there are no changes to apply.
The change made to the tags of a server outside of Terraform is now completely ignored.
Since it's a list, we can update more elements like ami, instance_type etc.

You can also replace the list with the all keyword.

    lifecycle {
        ignore_changes = all
    }

And this is especially useful if you do not want the resource to be modified for changes in any resource attributes.
