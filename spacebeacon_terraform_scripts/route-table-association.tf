#Resource: AWS Route Table association
resource "aws_route_table_association" "public1" {

  #Subnet ID
  subnet_id = aws_subnet.public1.id

  #ID of the associated routing table
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {

  #Subnet ID
  subnet_id = aws_subnet.public2.id

  #ID of the associated routing table
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {

  #Subnet ID
  subnet_id = aws_subnet.private1.id

  #ID of the associated routing table
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private2" {

  #Subnet ID
  subnet_id = aws_subnet.private2.id

  #ID of the associated routing table
  route_table_id = aws_route_table.private2.id
}
