vpc_name                           = "myvpc-1"
vpc_cidr_block                     = "10.0.0.0/16"
private_subnets                    = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets                     = ["10.0.100.0/24", "10.0.101.0/24"]
database_subnets                   = ["10.0.103.0/24", "10.0.104.0/24"]
create_database_subnet_group       = true
create_database_subnet_route_table = true
enable_nat_gateway                 = true
single_nat_gateway                 = true