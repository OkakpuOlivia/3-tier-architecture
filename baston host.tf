# Security Group for Bastion Host
resource "aws_security_group" "bastion_sg" {
  vpc_id = aws_vpc.myvpc.id

  # Allow SSH from your IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with your IP address or allowed range
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}

# Bastion Host EC2 Instance
resource "aws_instance" "bastion_host" {
  ami                         = "ami-02f64c390601e5f36" # Amazon Linux 2 (Change based on region/OS)
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.my_public_subnet01.id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  
  key_name                    = "mykeypair"  # Replace with your key pair name
  
  # Optional: User data to install any packages or configure the instance
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y amazon-ssm-agent
              service amazon-ssm-agent start
              EOF

  tags = {
    Name = "BastionHost"
  }

  # Associate public IP (required for internet access)
  associate_public_ip_address = true
}