# NAT Gateway (in a public subnet)
resource "aws_nat_gateway" "example_nat_gw" {
  subnet_id     = aws_subnet.my_public_subnet01.id
  allocation_id = aws_eip.nat_eip.id
}