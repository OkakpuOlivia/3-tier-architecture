# Create a load balancer
resource "aws_lb" "lb-internet-facing" {
  name            = "lb-internet-facing"
  load_balancer_type = "application"
  subnets         = [aws_subnet.my_public_subnet01.id, aws_subnet.my_public_subnet02.id]
  security_groups = [aws_security_group.lb-sg.id]
  internal        = false

  tags = {
    Environment = "production"
  }
}

# Create an internal facing load balancer
resource "aws_lb" "lb-internal-facing" {
  name            = "lb-internal-facing"
  load_balancer_type = "application"
  subnets         = [aws_subnet.my_private_subnet01.id, aws_subnet.my_private_subnet02.id]
  security_groups = [aws_security_group.lb-sg.id]
  internal        = true

  tags = {
    Environment = "production1"
  }
}