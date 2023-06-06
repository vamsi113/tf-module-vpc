#locals {
#  vpc_tags = {
#    Name   = "${var.env}-vpc"
#    ENV    = var.env
#    PROJECT= "roboshop"
#  }
#  vpc_peering_tags ={
#    Name   = "${var.env}-vpc_to_management_vpc"
#    ENV    = var.env
#    PROJECT= "roboshop"
#
#  }
#  vpc_ids = [ for k,v in aws_vpc.main: v.id ]
#}

locals {
  vpc_tags = {
    Name   = "${var.env}-vpc"
    ENV    = var.env
    PROJECT= "roboshop"
  }
  vpc_peering_tags ={
    Name   = "${var.env}-vpc_to_management_vpc"
    ENV    = var.env
    PROJECT= "roboshop"

  }

}