variable "region" {
  description = "AWS region where resources are deployed"
  type        = string
}

variable "project_name" {
  description = "Project name used as a prefix for resource tags"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "pub_sub1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
}

variable "pub_sub2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
}

variable "pri_sub3_cidr" {
  description = "CIDR block for private subnet 3"
  type        = string
}

variable "pri_sub4_cidr" {
  description = "CIDR block for private subnet 4"
  type        = string
}