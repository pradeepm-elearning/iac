Section-3 | Video-9 | Update and Destroy Infrastructure
-------------------------------------------------------

resource "local_file" "pets" {
  filename = "/home/ciuser/terraform_practice/pets.txt"
  content = "We love Pets!"
  file_permission = "0700"
}

terraform plan - will check if there are any changes in the configuration files.

If there are any changes in the configuration files, the already created file is deleted and a new file with the changes are created. This kind of infrastructure is called as immutable infrastructure.

terraform apply.

terraform destroy - to destroy the infrastructure completely.