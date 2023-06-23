#Resource: VPC
resource "aws_vpc" "main" {
  #CIDR block for the VPC
  cidr_block = "192.168.0.0/16"

  #Makes instances shared on the host
  instance_tenancy = "default"

  #Required for EKS 
  enable_dns_support = "true"

  #Required for EKS
  enable_dns_hostnames = "true"

  #Requests an Amazon provided IPv6 CIDR block with a /56 prefix length
  assign_generated_ipv6_cidr_block = "false"

  #Tags to assigned to the resource
  tags = {
    Name = "main"
  }
}
