
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  version = "5.5.2"

  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block

  azs              = var.azs
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.database_subnets

  create_database_subnet_group       = var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table


  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true

  create_database_nat_gateway_route = var.create_database_nat_gateway_route





  public_subnet_tags = {
    name = "public-subnet"


  }

  database_subnet_tags = {
    name = "database-pubnet"
  }

  private_subnet_tags = {
    name = "private-subnet"

  }


  vpc_tags = {
    name = var.vpc_tags
  }

}

