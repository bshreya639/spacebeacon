#Resource AWS NAT Gateway
resource "aws_nat_gateway" "gw1" {

  #Allocation ID of Elastic IP of the gateway
  allocation_id = aws_eip.nat1.id

  #Subnet ID of the subnet under which the gateway will be placed
  subnet_id = aws_subnet.public1.id

  #Tags assigned to the resource
  tags = {
    Name = "NAT 1"
  }
}

resource "aws_nat_gateway" "gw2" {

  #Allocation ID of Elastic IP of the gateway
  allocation_id = aws_eip.nat2.id

  #Subnet ID of the subnet under which the gateway will be placed
  subnet_id = aws_subnet.public2.id

  #Tags assigned to the resource
  tags = {
    Name = "NAT 2"
  }
}
