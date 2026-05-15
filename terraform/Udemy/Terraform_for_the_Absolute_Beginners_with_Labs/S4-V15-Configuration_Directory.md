Terraform configuration is not limited to one configuration.
It can be used for multiple configuration.

eg:

file1.tf
--------
resource "local_file" "dog" {
    filename = "/home/ciuser/dogs.txt"
    content = "I love dogs"
}

file2.tf
--------
resource "local_file" "cat" {
    filename = "/home/ciuser/cat.txt"
    content = "I hate cats"
}


Terraform will consider any .tf files within the directory.

Another common practice is having one single configuration file that contains all resource blocks required to provision the infrastructure.
A single configuration file can have as many number of configuration blocks that you need.

A common naming convention used for such a configuration file is to call it "main.tf"

eg:

main.tf
-------
resource "local_file" "dog" {
    filename = "/home/ciuser/dogs.txt"
    content = "I love dogs!"
}

resource "local_file" "cat" {
    filename = "/home/cisuer/cat.txt"
    content = "I hate Cats"
}

main.tf - Main configuration file containing resource definition.
variable.tf - Contains variable declarations
output.tf - Contains outputs from resources
providers.tf - Contains Provider definition