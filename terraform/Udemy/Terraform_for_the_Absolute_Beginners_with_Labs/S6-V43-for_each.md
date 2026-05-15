for_each

we saw that when we use count, the resources are created as a list and this can have undesirable results when updating them.
for_each overcomes the count issue.
for_each works only with variable "map" and "set" only.

There are 2 ways we can use this

1. using set/map variable.

main.tf

resource "local_file" "pet" {
    filename = each.value // the value of filename to each element in the list, we can make use of the expression each.value stored value.
    for_each = var.filename // instead of count
}


variable.tf

variable "filename" {
    type = set(string)
    default = [
        "/root/dog.txt",
        "/root/cat.txt",
        "/root/cow.txt"
    ]
}

2. toset function : This will convert the variables from a list to set.

main.tf

resource "local_file" "pet" {
    filename = each.value // the value of filename to each element in the list, we can make use of the expression each.value stored value.
    for_each = toset(var.filename) // instead of count
}


variable.tf

variable "filename" {
    type = list(string)
    default = [
        "/root/dog.txt",
        "/root/cat.txt",
        "/root/cow.txt"
    ]
}