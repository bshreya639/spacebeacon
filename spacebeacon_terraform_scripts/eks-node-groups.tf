#Resource: AWS IAM Role

#Create IAM Role for EKS Node Group
resource "aws_iam_role" "nodes_general" {

  #Name of the Role
  name = "eks-node-group-general"

  #Policy that grants permission to assume the role
  assume_role_policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  }
  POLICY
}

#Resource: AWS IAM Role Policy Attachment
resource "aws_iam_role_policy_attachment" "amazon_eks_worker_node_policy_general" {
  #ARN of the policy that will be applied
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

  #Role the policy is applied to
  role = aws_iam_role.nodes_general.name
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cni_policy_general" {
  #ARN of the policy that will be applied
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

  #Role the policy is applied to
  role = aws_iam_role.nodes_general.name
}

resource "aws_iam_role_policy_attachment" "amazon_ec2_container_registry_read_only" {
  #Role the policy is applied to
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

  #Role the policy is applied to
  role = aws_iam_role.nodes_general.name
}

#Resource: AWS EKS Node Group
resource "aws_eks_node_group" "nodes_general" {

  #Name of the Cluster
  cluster_name = aws_eks_cluster.eks.name

  #Name of the EKS Node Group
  node_group_name = "nodes-general"

  #ARN of IAM Role which provides permission to EKS
  node_role_arn = aws_iam_role.nodes_general.arn

  #Identifier of EC2 subnet to associate with EKS Node Group
  subnet_ids = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ]
  #Scaling configuration
  scaling_config {

    #Desired num of worker nodes
    desired_size = 1

    #Max num of worker nodes
    max_size = 1

    #Min num of worker nodes
    min_size = 1
  }

  #Associate AMI of the Node Group
  ami_type = "AL2_x86_64"

  #Capacity Type
  capacity_type = "ON_DEMAND"

  #Disk Size
  disk_size = 10

  #Force version update
  force_update_version = false

  #Instance type
  instance_types = ["t3.small"]

  labels = {
    role = "nodes-general"
  }

  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_worker_node_policy_general,
    aws_iam_role_policy_attachment.amazon_eks_cni_policy_general,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only
  ]
}
