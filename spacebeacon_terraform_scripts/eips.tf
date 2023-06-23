#Resource: AWS EIP
resource "aws_eip" "nat1" {

  #depends_on to set an explicit dependancy on IGW
  depends_on = [aws_internet_gateway.main]

}

resource "aws_eip" "nat2" {

  #depends_on to set an explicit dependancy on IGW
  depends_on = [aws_internet_gateway.main]

}
