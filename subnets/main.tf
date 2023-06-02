module "lm-subnets" {
  for_each      = var.subnets
  source        = "./lm-subnets"
  cidr_block    = each.value.cidr_block
  vpc_id        = var.vpc_id[0]
  env           = var.env
  name          = each.value.name
  subnet_availability_zones = var.subnet_availability_zones
  route_table_id = lookup(aws_route_table.route_table, each.value.name, null)
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