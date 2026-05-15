TERRAFORM CHEAT SHEET
:::::::::::::::::::::

terraform init

terraform plan : will check if there are any changes in the configuration files.

terraform apply

terraform show : displays the details of the resource created.

terraform destroy : to destroy the infrastructure completely.

terraform output : prints the output variable on screen
or
terraform output pet:name : prints the output of a specific variable.

terraform validate : validates the configuration file.

terraform fmt : format command; it scans the configuration files in the current working directory and formats the code into cannonical format. This a useful command to improve the readability of the terraform configuration file.

terraform show : prints out the current state of the infrastructure as seen by terraform.
terraform show -json : it prints the content in a json flag.

terraform providers : lists all the providers used in the configuration directory.
terraform providers mirror <PATH_OF_OTHER_FOLDER> : copies provider plugins needed for the current configuration to another directory.
eg: terraform providers mirror /tmp/terraform_files/

terraform output : prints all the output variables in the configuration directory.
terraform output <VARIABLE>: print the value of the specific variable by appending the name of the variable to the end of the output command.
eg: terraform output pet-name

terraform refresh : used to sync terraform with the real world infrastructure.