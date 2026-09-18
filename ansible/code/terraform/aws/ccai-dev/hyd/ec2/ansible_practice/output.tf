# output "ansible_test_client_private_ips" {
#   description = "Private IP addresses of the ansible test client instances"
#   value       = aws_instance.ansible_test_client[*].private_ip
# }

# output "ansible_test_client_public_ips" {
#   description = "Public IP addresses of the ansible test client instances"
#   value       = aws_instance.ansible_test_client[*].public_ip
# }

output "ansible_test_server_private_ips" {
  description = "Private IP addresses of the ansible test server instances"
  value       = aws_instance.ansible_test_server.private_ip
}

output "ansible_test_server_public_ips" {
  description = "Public IP addresses of the ansible test server instances"
  value       = aws_instance.ansible_test_server.public_ip
}

output "ansible_test_win_client_private_ip" {
  description = "Private IP address of the ansible test windows client instance"
  value       = aws_instance.ansible_test_win_client.private_ip
}

output "ansible_test_win_client_public_ip" {
  description = "Public IP address of the ansible test windows client instance"
  value       = aws_instance.ansible_test_win_client.public_ip
}

output "ansible_test_win_client_password" {
  description = "Administrator password of the ansible test windows client instance"
  value       = nonsensitive(rsadecrypt(aws_instance.ansible_test_win_client.password_data, file("~/azure_repo/CC-AgenticAI/AIOps/cloud/aws/ccai-dev/keys/hyderabad/kp-ccai-dev-hyd-ansible_test-ubuntu.pem")))
}
