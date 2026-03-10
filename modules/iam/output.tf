output "eks_cluster_role_arn" {
  description = "ARN of the IAM role used by the EKS control plane"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "node_group_role_arn" {
  description = "ARN of the IAM role used by the EKS node group"
  value       = aws_iam_role.node_group_role.arn
}