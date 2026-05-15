Section-3 | Video-8 | HashiCorp Configuraton Language (HCL) Basics
-------------------------------------------------------------------

HCL Syntax

<block> <parameters>
{
	key1 = value1
	key2 = value2
}

block - Infrastructure Platform and set of resources within that platform which we want to create.

eg:
resource "local_file" "pet"
{
	filename = "/home/ciuser/pets.txt"
	content = "We love Pets!"
}

resource - Block Name
local_file - Resource Type. This is fixed value and depends on the Provider where we want to create the resource.
	local - provider
	file - type of resource
pet - Resource Name. This is the logical name used to identified resource.
filename | content - Arguments

Simple Terraform Workflow consists of 4 Steps
1. Write a .tf file
2. Init phase - terraform init
3. Plan phase - terraform plan
4. Apply phase - terraform apply


terraform show - displays the details of the resource created.