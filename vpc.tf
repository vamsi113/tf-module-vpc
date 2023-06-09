#resource "aws_vpc" "main" {
#    for_each   = var.vpc
#    cidr_block = each.value.cidr_block
#    tags       = local.vpc_tags
#}

#module "additional_cidr_block" {
#    for_each                = var.vpc
#    additional_cidr_block   = each.value.additional_cidr_block
#    source                  = "./additional_vpc_cidr"
#    vpc_id                  = [ for k,v in aws_vpc.main: v.id]
#}
#
#output "vpc" {
#    value = [ for k,v in aws_vpc.main: v.id ]
#}

resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    tags       = local.vpc_tags
    enable_dns_hostnames = true
    enable_dns_support = true
}
#
output "vpc" {
    value = aws_vpc.main.id
}


#module "additional_cidr_block" {
#    for_each                = var.vpc
#    additional_cidr_block   = each.value.additional_cidr_block
#    source                  = "./additional_vpc_cidr"
#    vpc_id                  = [ for k,v in aws_vpc.main: v.id]
#}
#
#output "vpc" {
#    value = [ for k,v in aws_vpc.main: v.id ]
#}
