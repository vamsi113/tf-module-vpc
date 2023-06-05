module "lm-subnets" {
  for_each      = var.subnets
  source        = "./lm-subnets"
  cidr_block    = each.value.cidr_block
  vpc_id        = var.vpc_id[0]
  env           = var.env
  name          = each.value.name
  subnet_availability_zones = var.subnet_availability_zones
  route_table_id = lookup(lookup(aws_route_table.route_table, each.value.name, null), "id", null)
  //[ for k,v in aws_route_table.route_table: v.id ]
}

resource "aws_route_table" "route_table" {
  for_each      = var.subnets
  vpc_id        = var.vpc_id[0]
  tags = {
    Name    = "${var.env}-${each.value.name}-rt"
    ENV     = var.env
    PROJECT = "roboshop"

  }
}



resource "aws_route" "peering_connection_route" {
  for_each                  = var.subnets
  route_table_id            = lookup(lookup(aws_route_table.route_table, each.value.name, null), "id", null)
  destination_cidr_block    = lookup(var.management_vpc, "default_vpc_cidr", null )
  vpc_peering_connection_id = var.peering_connection_id
}

#locals {
#  subnet_lists = flatten([ for i,j in module.lm-subnets: j.subnets ])
#}
#
#output "subnets_list" {
#  value = local.subnet_lists[*].id
#}

#output "subnets" {
#  value = module.lm-subnets
#}

#output "route_tables" {
#  value = aws_route_table.route_table
#}

#output "route_tables" {
#  value = [for k,v in aws_route_table.route_table: v.id] ## here output will be in list
#  ##{
#     ##for k,v in aws_route_table.route_table: k=> v.id ## here output will be map
#   ## }
#}

