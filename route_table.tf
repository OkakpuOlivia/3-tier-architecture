#Creating Route Table - public
resource "aws_route_table" "my_public_route_table" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = "ij_publicRoute"
  }
}

#Private Route Table (routes to NAT Gateway)
resource "aws_route_table" "my_private_route_table" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.example_nat_gw.id
  }

  tags = {
    Name = "ij_privateRoute"
  }
}