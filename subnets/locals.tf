locals {
  route_table_ids           = lookup(lookup(aws_route_table.route_table, each.value.name, null), "id", null)
}