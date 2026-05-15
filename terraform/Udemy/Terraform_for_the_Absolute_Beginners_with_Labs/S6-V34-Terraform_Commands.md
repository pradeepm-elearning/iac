terraform validate : validates the configuration file.

main.tf

resource "local_file" "pets" {
    filename = "/root/pet.txt"
    content = "I love Pets"
}

Once we write our configuration file, it's not necessary to run the terraform plan or apply to check if the syntax used is correct.
Instead, we can make use of data from validated command like this.

And if everything is correct with the file, we should see a successful revalidation message like this.