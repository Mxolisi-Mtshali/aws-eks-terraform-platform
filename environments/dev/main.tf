# create VPC
module "vpc" {
  source        = "../../modules/vpc"
  region        = var.region
  project_name  = var.project_name
  vpc_cidr      = var.vpc_cidr
  pub_sub1_cidr = var.pub_sub1_cidr
  pub_sub2_cidr = var.pub_sub2_cidr
  pri_sub3_cidr = var.pri_sub3_cidr
  pri_sub4_cidr = var.pri_sub4_cidr
}

# create NAT gateway
module "nat_gateway" {
  source      = "../../modules/nat-gateway"
  igw_id      = module.vpc.igw_id
  vpc_id      = module.vpc.vpc_id
  pub_sub1_id = module.vpc.pub_sub1_id
  pub_sub2_id = module.vpc.pub_sub2_id
  pri_sub3_id = module.vpc.pri_sub3_id
  pri_sub4_id = module.vpc.pri_sub4_id
}

# create IAM
module "iam" {
  source       = "../../modules/iam"
  project_name = var.project_name
}

# create key pair
module "key_pair" {
  source = "../../modules/key-pair"

  key_name        = "todo-app"
  public_key_path = "${path.module}/keys/todo-app.pub"
}

# create EKS cluster
module "eks" {
  source = "../../modules/eks"

  project_name         = var.project_name
  eks_cluster_role_arn = module.iam.eks_cluster_role_arn
  kubernetes_version   = "1.35"

  subnet_ids = [
    module.vpc.pub_sub1_id,
    module.vpc.pub_sub2_id,
    module.vpc.pri_sub3_id,
    module.vpc.pri_sub4_id
  ]
}

# create node group
module "node_group" {
  source = "../../modules/node-group"

  eks_cluster_name    = module.eks.eks_cluster_name
  node_group_role_arn = module.iam.node_group_role_arn

  subnet_ids = [
    module.vpc.pri_sub3_id,
    module.vpc.pri_sub4_id
  ]
}