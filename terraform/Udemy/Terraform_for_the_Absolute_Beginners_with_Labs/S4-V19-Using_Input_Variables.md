INPUT VARIABLES

To re-use the code, we will be using Variables as hard coding the values are advisable.

main.tf
-------
resource "local_file" "pets" {
    filename = var.filename
    content = var.content
}

resource "random_pet" "mypet" {
    prefix = var.prefix
    separator = var.separator
    length = var.length
}


variables.tf
------------
variable "filename" {
    default = "/home/ciuser/pets.txt"
}

variable "content" {
    default = "We love pets"
}

variable "prefix" {
    default = "Mrs"
}

variable "separator" {
    default = "."
}

variable "length" {
    default = "2"
}