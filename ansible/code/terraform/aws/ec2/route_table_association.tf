resource "aws_route_table_association" "rta_ansible_test" {
  subnet_id = aws_subnet.subnet_ansible_test.id
  route_table_id = aws_route_table.rt_ansible_test.id
}
