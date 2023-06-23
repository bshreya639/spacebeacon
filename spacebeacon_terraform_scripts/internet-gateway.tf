#resource: Internet Gateway
resource "aws_internet_gateway" "main" {
  #VPC ID that will be created
  vpc_id = aws_vpc.main.id

  #Tags assigned to the resource
  tags = {
    Name = "main"
  }
}
