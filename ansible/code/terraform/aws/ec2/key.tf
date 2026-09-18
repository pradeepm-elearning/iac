resource "aws_security_group" "sg_tf_test" {
    name = "ssh-access"
    description = "This Security Group was created using Terraform"
    vpc_id = ""
    ingress {
        description = "SSH Access"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "SSH Access"
    }
}

resource "tls_private_key" "tls_key_gen_test" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "ec2_key_pair_test" {
    key_name = "ec2-access-key"
    public_key = tls_private_key.tls_key_gen_test.public_key_openssh
}

resource "local_file" "pem_file_creation" {
    filename = "ec2_tf_test.pem"
    content = tls_private_key.tls_key_gen_test.private_key_pem
    file_permission = 0400
}