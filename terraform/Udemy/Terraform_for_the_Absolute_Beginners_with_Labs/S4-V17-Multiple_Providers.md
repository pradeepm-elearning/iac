RANDOM

This provider allows us to create a Random resources.
random_id
random_integer
random_password
random_pet
random_shuffle
random_string
random_uuid


main.tf
-------
resource "local_file" "mypet" {
    filename = "/home/ciuser/mypet.txt"
    content = "I love Pets"
}

resouce "random_pet" "pet" {
    prefix = "Mr"
    separator = "."
    length = "1"
}

