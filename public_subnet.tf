# Create a public subnet
resource "aws_subnet" "my_public_subnet01" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1a"
  tags = {
    Name = "ij-pub-subnet01"
  }
}

# Create a public subnet
resource "aws_subnet" "my_public_subnet02" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1b"
  tags = {
    Name = "ij-pub-subnet02"
  }
}