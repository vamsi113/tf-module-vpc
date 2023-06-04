module "lm-subnets" {
  for_each      = var.subnets
  source        = "./lm-subnets"
  cidr_block    = each.value.cidr_block
  vpc_id        = var.vpc_id[0]
  env           = var.env
  name          = each.value.name
  subnet_availability_zones = var.subnet_availability_zones
  route_table_id = local.route_table_ids
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

#output "subnets" {
#  value = module.lm-subnets
#}

#output "route_tables" {
#  value = aws_route_table.route_table
#}

resource "aws_route" "peering_connection_route" {
  count                     = length(aws_route_table.route_table)
  route_table_id            = element(aws_route_table.route_table.*.id, count.index )
  destination_cidr_block    = lookup(var.management_vpc, "default_vpc_cidr", null )
  vpc_peering_connection_id = var.peering_connection_id
}