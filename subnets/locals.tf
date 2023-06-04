locals {
  subnet_lists = flatten([ for i,j in module.lm-subnets: j.subnets ])
}