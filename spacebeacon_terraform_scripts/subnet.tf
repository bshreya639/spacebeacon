#Resource: AWS Subnets
resource "aws_subnet" "public1" {

  #VPC ID
  vpc_id = aws_vpc.main.id

  #CIDR block of the subnet
  cidr_block = "192.168.0.0/18"

  #AZ of the subnet
  availability_zone = "eu-central-1a"

  #Required for EKS
  map_public_ip_on_launch = "true"

  #Tags assigned to the resource
  tags = {
    Name                        = "public-eu-central-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public2" {

  #VPC ID
  vpc_id = aws_vpc.main.id

  #CIDR block of the subnet
  cidr_block = "192.168.64.0/18"

  #AZ of the subnet
  availability_zone = "eu-central-1b"

  #Required for EKS
  map_public_ip_on_launch = "true"

  #Tags assigned to the resource
  tags = {
    Name                        = "public-eu-central-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private1" {

  #VPC ID
  vpc_id = aws_vpc.main.id

  #CIDR block of the subnet
  cidr_block = "192.168.128.0/18"

  #AZ of the subnet
  availability_zone = "eu-central-1a"

  #Required for EKS
  map_public_ip_on_launch = "true"

  #Tags assigned to the resource
  tags = {
    Name                        = "private-eu-central-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private2" {

  #VPC ID
  vpc_id = aws_vpc.main.id

  #CIDR block of the subnet
  cidr_block = "192.168.192.0/18"

  #AZ of the subnet
  availability_zone = "eu-central-1b"

  #Required for EKS
  map_public_ip_on_launch = "true"

  #Tags assigned to the resource
  tags = {
    Name                        = "private-eu-central-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}
