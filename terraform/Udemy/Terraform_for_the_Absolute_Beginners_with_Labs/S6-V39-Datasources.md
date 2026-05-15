DATA SOURCES
Data sources allow terraform to read attributes from resources are provision outside terraform.

Infrastructure can be provisioned using other tools such as puppet, cloudformation, saltstack, ansible etc and even adhoc shell scripts or manually provision infrastructure or even the sources that are created by terraform from under the configuration directory.

For example, assume that a database instance was provisioned manually on AWS Cloud. Though terraform doesnt manage these resources, it can read attribute like database name, hostname, IP address or the DB User and use it to provision an application user that is managed by terraform.

main.tf

resource "local_file" "pets" {
    filename = "/root/pets.txt
    content = data.local_file.dog.content
}

data "local_file" "dog" {
    filename = "/root/dogs.txt"
}

dogs.sh

echo "I love dogs" > dogs.txt


