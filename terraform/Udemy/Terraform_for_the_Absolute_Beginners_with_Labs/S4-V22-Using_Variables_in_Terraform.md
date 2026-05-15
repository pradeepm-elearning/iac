# S3 V22 USING VARIABLES IN TERRAFORM
### There are many ways we can use Input Variables in Terraform.
**1. Create input variables in Terraform and assign default value to it based on a variable type.**

*main.tf*
```
resource "local_file" "pet" {
    filename = var.filename
    content = var.content
}

resource "random_pet" "my-pet" {
    prefix = var.prefix
    separator = var.separator
    length = var.length
}
```

*variable.tf*
```
variable "filename" {
    default = "/home/cisuser/pets.txt"
}

variable "content" {
    default = "We Love Pets"
}

variable "prefix" {
    default = "Mr"
}

variable "separator" {
    default ="."
}

variable "length" {
    default = 2
}
```

**2. Interactive Mode.**

*main.tf*
```
resource "local_file" "pet" {
    filename = var.filename
    content = var.content
}

resource "random_pet" "my-pet" {
    prefix = var.prefix
    separator = var.separator
    length = var.length
}
```

*variable.tf*
```
variable "filename" {}
variable "content" {}
variable "prefix" {}
variable "separator" {}
variable "length" {}
```

**3. Command Line Flags.**

`terraform apply -var "filename = /home/ciuser/pets.txt" -var "content = We Love Pets" -var "prefix = Mr" -var "separator = .", -var "length = 2"`

**4. Environmental Variables**

`export TF_VAR_filename = "/home/ciuser/pets.txt"`  
`export TF_VAR_content = "We Love Pets!"`  
`export TF_VAR_prefix = "Mr"`  
`export TF_VAR_separator = "."`  
`export TF_VAR_length = "2"`  
`terraform apply`  

**5. Variable Definition Files: with below filename, loads automatically.**

terraform.tfvars / terraform.tfvars.json / terraform.auto.tfvars / terraform.auto.tfvars.json
```
filename = "/home/ciuser/pets.txt"
content = "We Love Pets!"
prefix = "Mr"
separator = "."
length = "2"
```
`terraform apply`


If we use any other filename apart from "terraform.tfvars / terraform.tfvars.json / terraform.auto.tfvars / terraform.auto.tfvars.json", we need to pass a filename argument.

`terraform apply -var-file variables.tfvars`

**6. Variable Definition Precedence**

| ORDER | PRIORITY | OPTIONS |
| ----------- | ----------- | ----------- |
| 1 | 4 | Environment Variables |
| 2 | 3 | terraform.tfvars |
| 3 | 2 | *.auto.tfvars (alphabetical order) |
| 4 | 1 | -var / -var-file (command line flags) |
