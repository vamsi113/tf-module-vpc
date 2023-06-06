#output "subnets" {
#  value = module.subnets
#}

#output "route_tables" {
#  value = module.subnets.route_tables
#}

#output "public_subnets" {
#  value = module.public_subnets
#}
#
#output "private_subnets" {
#  value = module.private_subnets
#}

#output "all_private_subnets" {
#  value = [for k,v in module.private_subnets: k]
#}

###updated modules

output "private_subnets" {
  value = module.private_subnets
}
