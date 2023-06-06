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
output "public_subnets" {
  value = module.public_subnets
}

#output "all-route_tables" {
#  value = local.all-route_tables
#}

output "test" {
  value = lookup(lookup(module.public_subnets, "public", null), "subnets", null)[0].id
}