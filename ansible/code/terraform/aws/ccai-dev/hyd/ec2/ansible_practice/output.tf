output "ansible_test_client_private_ips" {
  description = "Private IP addresses of the ansible test client instances"
  value       = aws_instance.ansible_test_client[*].private_ip
}

output "ansible_test_client_public_ips" {
  description = "Public IP addresses of the ansible test client instances"
  value       = aws_instance.ansible_test_client[*].public_ip
}

output "ansible_test_server_private_ips" {
  description = "Private IP addresses of the ansible test server instances"
  value       = aws_instance.ansible_test_server.private_ip
}

output "ansible_test_server_public_ips" {
  description = "Public IP addresses of the ansible test server instances"
  value       = aws_instance.ansible_test_server.public_ip
}

