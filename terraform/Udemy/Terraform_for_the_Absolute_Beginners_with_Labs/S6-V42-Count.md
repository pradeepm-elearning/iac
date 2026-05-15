COUNT

Its a meta arguments.
It is used to create multiple instances of local file.

main.tf 

resource "local_file" "pet" {
    filename = var.filename
    content = "I love Pets"
    count = 3
}


variables.tf

variable "filename" {
    default = "/root/pets.txt"
}


However, there's one problem with this approach. Since we have only specified the count terraform will try to create the same resource 3 times since the file name is not unique terraform will recreate the same file 3 times, rather than creating 3 separate files.

A better way to do this and make sure that all 3 resources have unique file names is to make use of a list of variable.

main.tf

resource "local_file" "pet" {
    filename = var.filename[count.index]
    content = "I Love Pets"
    count = 3
}

variable.tf

variable "filename" {
    default = [
        "/root/pets.txt",
        "/root/dogs.txt",
        "/root/cats.txt"
    ]    
}

This approach has a drawback. When we want to add more than 3 files to be created, still 3 files will be created due to the count = 3.
We want the count to automatically pick up the number of items that are defined within the file name variable.
To do this, we can set the value of count to use a Built-In function that will return the length of the list.

length: The length function is used to calculate the size of a list, and we can use this function in the counter meta argument to dynamically determine the size of the variable.
It will set the count to the number of list available in the specified variable.

main.tf

resource "local_file" "pet" {
    filename = var.filename[count.index]
    content = "I Love Pets"
    count = length(var.filename)
}

variable.tf

variable "filename" {
    default = [
        "/root/pets.txt",
        "/root/dogs.txt",
        "/root/cats.txt",
        "/root/cows.txt"
    ]    
}

Terraform offers several built in function that allows us to manipulate values within expressions.
Length function is one such function.



There is another drawback with this approach when we use the counter meta argument to loop through variables.
If we remove one of the elements, then terraform destroys and replaces each and every element due to the index being shifted to previous elements.
 
To over this issue, we use for_each.