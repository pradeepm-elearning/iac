resource "aws_security_group" "sg_ansible_test" {
  name = "sg_ssh-access-test"
  description = "This SG was created using Terraform for Ansible Test"
  vpc_id = aws_vpc.vpc_ansible_test.id
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
