data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "17.1.0"
  cluster_name = "todo"
  cluster_version = "1.20"
  subnets = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id
  cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  write_kubeconfig = true
  manage_aws_auth = true
  cluster_encryption_config = [
    {
      provider_key_arn = aws_kms_key.eks.arn
      resources = ["secrets"]
    }
  ]
  worker_groups = [
    {
      name = "worker-group-1"
      instance_type = "t2.micro"
      asg_desired_capacity = 1
      asg_max_size = 1
      asg_min_size = 1
      autoscaling_enabled = true
      kubelet_extra_args = "--node-labels=node.kubernetes.io/lifecycle=normal"
    }
  ]
  
}     



   
        
    
