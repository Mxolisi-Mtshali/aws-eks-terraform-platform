variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_group_role_arn" {
  description = "IAM role ARN used by the EKS node group"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs for the EKS node group"
  type        = list(string)
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 2
}

variable "ami_type" {
  description = "AMI type for the EKS worker nodes"
  type        = string
  default     = "AL2_x86_64"
}

variable "capacity_type" {
  description = "Capacity type for the EKS node group"
  type        = string
  default     = "ON_DEMAND"
}

variable "disk_size" {
  description = "Disk size in GB for worker nodes"
  type        = number
  default     = 20
}

variable "instance_types" {
  description = "List of EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.small"]
}