resource "aws_internet_gateway" "gw" {
  count   = length(local.vpc_ids)
  vpc_id  = element(local.vpc_ids, count.index)

  tags = {
    Name = "${var.env}-igw"
  }
}

#resource "aws_eip" "ip" {
#  domain = "vpc"
#}
#
#resource "aws_nat_gateway" "ngw" {
#  allocation_id = aws_eip.ip.id
#  #subnet_id     = aws_subnet.example.id
#
#  tags = {
#    Name = "${var.env}-nat"
#  }
#
#}