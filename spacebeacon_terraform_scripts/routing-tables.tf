#Resource: Route Table
resource "aws_route_table" "public" {

  #VPC ID
  vpc_id = aws_vpc.main.id

  route {
    #CIDR block of the route
    cidr_block = "0.0.0.0/0"

    #Identifier of VPC IGW
    gateway_id = aws_internet_gateway.main.id
  }

  #Tags assigned to the resource
  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private1" {

  #VPC ID
  vpc_id = aws_vpc.main.id

  route {
    #CIDR block of the route
    cidr_block = "0.0.0.0/0"

    #Identifier of VPC IGW
    gateway_id = aws_nat_gateway.gw1.id
  }

  #Tags assigned to the resource
  tags = {
    Name = "private1"
  }
}

resource "aws_route_table" "private2" {

  #VPC ID
  vpc_id = aws_vpc.main.id

  route {
    #CIDR block of the route
    cidr_block = "0.0.0.0/0"

    #Identifier of VPC IGW
    gateway_id = aws_nat_gateway.gw2.id
  }

  #Tags assigned to the resource
  tags = {
    Name = "private2"
  }
}
