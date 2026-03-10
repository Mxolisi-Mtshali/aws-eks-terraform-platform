resource "aws_eip" "nat_gw1_eip" {
  vpc = true

  tags = {
    Name = "nat-gw-eip-1"
  }
}

resource "aws_eip" "nat_gw2_eip" {
  vpc = true

  tags = {
    Name = "nat-gw-eip-2"
  }
}

resource "aws_nat_gateway" "nat_gw1" {
  allocation_id = aws_eip.nat_gw1_eip.id
  subnet_id     = var.pub_sub1_id

  tags = {
    Name = "nat-gw-1"
  }
}

resource "aws_nat_gateway" "nat_gw2" {
  allocation_id = aws_eip.nat_gw2_eip.id
  subnet_id     = var.pub_sub2_id

  tags = {
    Name = "nat-gw-2"
  }
}

resource "aws_route_table" "private_rt_a" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw1.id
  }

  tags = {
    Name = "private-rt-a"
  }
}

resource "aws_route_table_association" "pri_sub3_assoc" {
  subnet_id      = var.pri_sub3_id
  route_table_id = aws_route_table.private_rt_a.id
}

resource "aws_route_table" "private_rt_b" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw2.id
  }

  tags = {
    Name = "private-rt-b"
  }
}

resource "aws_route_table_association" "pri_sub4_assoc" {
  subnet_id      = var.pri_sub4_id
  route_table_id = aws_route_table.private_rt_b.id
}