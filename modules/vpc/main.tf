resource "aws_vpc" "this" {
  cidr_block                       = var.vpc_cidr
  instance_tenancy                 = "default"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "pub_sub1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.pub_sub1_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name                                        = "pub-sub1"
    "kubernetes.io/cluster/${var.project_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }
}

resource "aws_subnet" "pub_sub2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.pub_sub2_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = {
    Name                                        = "pub-sub2"
    "kubernetes.io/cluster/${var.project_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route_table_association" "pub_sub1_assoc" {
  subnet_id      = aws_subnet.pub_sub1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "pub_sub2_assoc" {
  subnet_id      = aws_subnet.pub_sub2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "pri_sub3" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.pri_sub3_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name                                        = "pri-sub3"
    "kubernetes.io/cluster/${var.project_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}

resource "aws_subnet" "pri_sub4" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.pri_sub4_cidr
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name                                        = "pri-sub4"
    "kubernetes.io/cluster/${var.project_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}