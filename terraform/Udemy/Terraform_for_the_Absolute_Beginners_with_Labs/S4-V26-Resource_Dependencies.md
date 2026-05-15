### RESOURCE DEPENDENCIES

When terraform creates the resource, it knows about the dependencies. Since the local file depends on the output of Random pet resource.
As a result, it first provisions the Random Pet resource and then local file resource.
When the resource are deleted it deletes in reverse order. First local file resource and then Random Pet.
This type of depencies is called Implicit Dependency.

Explicit Dependency
Explicitly specifying a dependency is only necessary when a resource relies on some other resource indirectly and it doesnt make use of a reference expression.

main.tf

resource "local_file" "pet" {
    filename = var.filename
    content = "My favourite pet is Dog"
    depends_on = [
        random_pet.my-pet
    ]
}

resource "random_pet" "my-pet" {
    prefix = var.prefix
    separator = var.separator
    length = var.length
}