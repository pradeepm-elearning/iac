resource "aws_route_table" "rt_ansible_test" {
  vpc_id = aws_vpc.vpc_ansible_test.id
  tags = {
    Name = "rt-ansible-test"
  }
  route {
    cidr_block = aws_vpc.vpc_ansible_test.cidr_block
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_ansible_test.id
  }
}
