variable "project_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_cluster_role_arn" {
  description = "IAM role ARN used by the EKS control plane"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.29"
}

variable "subnet_ids" {
  description = "List of subnet IDs used by the EKS cluster"
  type        = list(string)
}

