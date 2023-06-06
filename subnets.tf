#module "public_subnets" {
#  for_each  = var.vpc
#  source    = "./subnets"
#  subnets   = each.value.public_subnets
#  vpc_id    = [ for k,v in aws_vpc.main: v.id ]
#  env       = var.env
#  subnet_availability_zones = each.value.subnet_availability_zones
#  peering_connection_id     = aws_vpc_peering_connection.management_vpc_to_env_vpc.*.id[0]
#  management_vpc            = var.management_vpc
#  internet_connection_id     = aws_internet_gateway.gw.*.id[0]
#
#}
#
#module "private_subnets" {
#  for_each  = var.vpc
#  source    = "./subnets"
#  subnets   = each.value.private_subnets
#  vpc_id    = [ for k,v in aws_vpc.main: v.id ]
#  env       = var.env
#  subnet_availability_zones = each.value.subnet_availability_zones
#  peering_connection_id     = aws_vpc_peering_connection.management_vpc_to_env_vpc.*.id[0]
#  management_vpc            = var.management_vpc
#  internet_connection_id     = aws_internet_gateway.gw.*.id[0]
#
#}



module "public_subnets" {
  for_each  = var.public_subnets
  source    = "./subnets"
  cidr_block   = each.value.cidr_block
  vpc_id    = aws_vpc.main.id
  env       = var.env
  name = each.value.name
  subnet_availability_zones = var.subnet_availability_zones
#  peering_connection_id     = aws_vpc_peering_connection.management_vpc_to_env_vpc.id
  management_vpc            = var.management_vpc
  gateway_id     = aws_internet_gateway.igw.id

}

module "private_subnets" {
  for_each  = var.private_subnets
  source    = "./subnets"
  cidr_block   = each.value.cidr_block
  vpc_id    = aws_vpc.main.id
  env       = var.env
  name = each.value.name
  subnet_availability_zones = var.subnet_availability_zones
#  peering_connection_id     = aws_vpc_peering_connection.management_vpc_to_env_vpc.id
  management_vpc            = var.management_vpc
  gateway_id     = aws_nat_gateway.ngw.id

}

