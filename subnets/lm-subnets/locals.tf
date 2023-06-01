locals {
  subnet_tags = {
    Name   = "${var.name}-subnets"
    ENV    = var.env
    PROJECT= "roboshop"
  }
}