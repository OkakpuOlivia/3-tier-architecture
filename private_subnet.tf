# Create a private subnet
resource "aws_subnet" "my_private_subnet01" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "ij-prv-subnet01"
  }
}

# Create a private subnet
resource "aws_subnet" "my_private_subnet02" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "ij-prv-subnet02"
  }
}