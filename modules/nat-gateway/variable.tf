variable "pub_sub1_id" {
  description = "Public subnet 1 ID for NAT gateway 1"
  type        = string
}

variable "pub_sub2_id" {
  description = "Public subnet 2 ID for NAT gateway 2"
  type        = string
}

variable "pri_sub3_id" {
  description = "Private subnet 3 ID associated with route table A"
  type        = string
}

variable "pri_sub4_id" {
  description = "Private subnet 4 ID associated with route table B"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where NAT gateways and route tables are created"
  type        = string
}

variable "igw_id" {
  description = "Internet gateway ID from the VPC module"
  type        = string
}