resource "aws_eks_node_group" "this" {
  cluster_name    = var.eks_cluster_name
  node_group_name = "${var.eks_cluster_name}-node-group"
  node_role_arn   = var.node_group_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  ami_type             = var.ami_type
  capacity_type        = var.capacity_type
  disk_size            = var.disk_size
  force_update_version = false
  instance_types       = var.instance_types

  labels = {
    role = "${var.eks_cluster_name}-node-group-role"
    name = "${var.eks_cluster_name}-node-group"
  }
}