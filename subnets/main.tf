module "lm-subnets" {
  source        = "./lm-subnets"
  for_each      = var.subnets
  cidr_block    = each.value.cidr_block
  vpc_id        = var.vpc_id

}