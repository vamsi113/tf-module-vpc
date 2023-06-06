#locals {
#  subnet_lists = flatten([ for i,j in module.lm-subnets: j.subnets ])
#}
#
#output "subnets_list" {
#  value = local.subnet_lists[*].id
#}
#
#output "subnets" {
#  value = module.lm-subnets
#}
#
###output "route_tables" {
###  value = aws_route_table.route_table
###}
##
#output "route_tables" {
#  value = [for k,v in aws_route_table.route_table: v.id] ## here output will be in list
#  ##{
#     ##for k,v in aws_route_table.route_table: k=> v.id ## here output will be map
#   ## }
#}
#


###updated modules

output "subnets" {
  value = aws_subnet.main
}

output "route_tables" {
  value = aws_route_table.route_table
}