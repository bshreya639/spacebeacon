#Resource: AWS IAM Role
resource "aws_iam_role" "eks_cluster" {

  #Name of the Role
  name = "eks-cluster"

  #Role that EKS will use to create resources for the cluster
  assume_role_policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  }
  POLICY
}

#Resource: AWS IAM Role Policy Attachment
resource "aws_iam_role_policy_attachment" "amazon_eks_cluster_policy" {

  #ARN of the policy that is applied
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

  #Role the policy will be applied to
  role = aws_iam_role.eks_cluster.name
}

#Resource: AWS EKS Cluster
resource "aws_eks_cluster" "eks" {

  #Name of the cluster
  name = "eks"

  #ARN of the IAM Role that provides permissions for Kubernetes Control Plane to make calls to AWS API operations on your behalf
  role_arn = aws_iam_role.eks_cluster.arn
  vpc_config {
    #Indicates if EKS private API server endpoint is enabled
    endpoint_private_access = false

    #Indicates if EKS public API server endpoint is enabled
    endpoint_public_access = true

    #At least in 2 AZs
    subnet_ids = [
      aws_subnet.public1.id,
      aws_subnet.public2.id,
      aws_subnet.private1.id,
      aws_subnet.private2.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy
  ]
}
