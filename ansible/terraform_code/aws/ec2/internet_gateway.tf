resource "aws_internet_gateway" "ig_ansible_test" {
  vpc_id   = aws_vpc.vpc_ansible_test.id
  tags = {
    Name = "ig-ansible-test"
  }
}