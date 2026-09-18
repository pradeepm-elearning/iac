# Fetch the latest Ubuntu 22.04 LTS ARM64 (aarch64) AMI for t4g instances
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

# Security Group allowing all inbound and outbound traffic
resource "aws_security_group" "ansible_test_allow_all" {
  name        = "ansible_test_allow_all"
  description = "Temporary security group allowing all traffic for testing"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 1. Ansible Test Server (t4g.medium) with file-based user data
resource "aws_instance" "ansible_test_server" {
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t4g.medium"
  key_name             = "kp-ccai-dev-hyd-ansible_test-ec2-user"
  security_groups      = [aws_security_group.ansible_test_allow_all.name]
  associate_public_ip_address = true
  user_data            = file("${path.module}/user_data-server.sh")

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "ansible_test_server"
  }
}

# # 2. Ansible Test Clients (3 x t4g.small)
# resource "aws_instance" "ansible_test_client" {
#   count                = 3
#   ami                  = data.aws_ami.ubuntu.id
#   instance_type        = "t4g.small"
#   key_name             = "kp-ccai-dev-hyd-ansible_test-ec2-user"
#   security_groups      = [aws_security_group.ansible_test_allow_all.name]
#   associate_public_ip_address = true
#   user_data            = file("${path.module}/user_data-client.sh")

#   root_block_device {
#     volume_size = 8
#   }

#   tags = {
#     Name = "ansible_test_client-${count.index + 1}"
#   }
# }

# 3. Ansible Test Windows Client (t3.medium)
resource "aws_instance" "ansible_test_win_client" {
  ami                         = "ami-0cb49bbe58aca3539"
  instance_type               = "t3.medium"
  key_name                    = "kp-ccai-dev-hyd-ansible_test-ec2-user"
  security_groups             = [aws_security_group.ansible_test_allow_all.name]
  associate_public_ip_address = true
  get_password_data           = true

  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = "ansible_test_win_client"
  }
}
