Version Constraints

The functionality of a provider plugin may vary drastically from one version to another.
We can make sure that a specific version of the provider is used by Terraform when we run the "terraform init" command.

The instructions to use a specific version of a provider is available in the provided documentation in the registry.
https://registry.terraform.io/

terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
}


version = "!= 2.4.0" - Not equal to. Downloads previous version.
version = "< 2.4.0" - Downloads lesser than 2.4.0
version = "> 2.4.0" - Downloads greater than 2.4.0
version = "> 1.2.0, < 2.4.0 != 1.4.0" - combine the comparision operators to make use of specific version within a range.
version = "~> 1.2" - pessimistic constraint operators; download specific version or any available incremental version based on value provided.
version = "~> 1.2.0" - pessimistic constraint operators; download specific sub version or any available incremental sub version based on value provided.
