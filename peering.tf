resource "aws_vpc_peering_connection" "management_vpc_to_env_vpc" {
  peer_vpc_id   =  aws_vpc.main.id
  vpc_id        = lookup(var.management_vpc, "vpc_id", null )
  auto_accept   = true
  tags          = local.vpc_peering_tags
}
#
resource "aws_route" "route_to_default_management_route_table" {
  count =                 length(local.all-route_tables)
  route_table_id            = element(local.all-route_tables,count.index )
  destination_cidr_block    = lookup(var.management_vpc,"default_vpc_cidr", null)
  vpc_peering_connection_id = aws_vpc_peering_connection.management_vpc_to_env_vpc.id
}