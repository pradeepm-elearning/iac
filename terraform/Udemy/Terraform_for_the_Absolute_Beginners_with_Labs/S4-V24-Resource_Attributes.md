### RESOURCE ATTRIBUTES

*main.tf*
```
resource "local_file" "pet" {
    filename = var.filename
    content = "my favourite pet is ${random_pet.my-pet.id}"
}

resource "random_pet" "my-pet" {
    prefix = "Mr"
    separator = "."
    length = 1
}
```
