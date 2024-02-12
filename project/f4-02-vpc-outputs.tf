output "vpc_id" {
  value = module.vpc.vpc_id

}
output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "default_security_group_id" {
  value = module.vpc.default_security_group_id

}
output "bd_nat_gateway_route_id" {
  value = module.vpc.database_nat_gateway_route_ids

}
output "private_nat_gateway_route_id" {
  value = module.vpc.private_nat_gateway_route_ids

}
output "NAT_gateway_id" {
  value = module.vpc.natgw_ids

}
output "public_subnet_arn" {
  value = module.vpc.public_subnet_arns
}
output "private_subnet_arn" {
  value = module.vpc.private_subnet_arns

}
output "db_subnet_arn" {
  value = module.vpc.database_subnet_arns

}
output "public_subnets" {
  value = module.vpc.public_subnets
}
output "private_subnets" {
  value = module.vpc.private_subnets

}
output "db_subnets" {
  value = module.vpc.database_subnets

}
output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}
