//aws public bastion-jumserver bastion security group outputs
//public_bastion_sg_group_id
//public_bastion_sg_name
//public_bastion_sg_group_arn


output "public_bastion_sg_group_arn" {
  description = "The ARN of the security group"
  value       = module.public_group.security_group_arn
}

output "public_bastion_sg_group_id" {
  description = "The ID of the security group"
  value       = module.public_group.security_group_id
}

output "public_bastion_sg_name" {
  description = "The name of the security group"
  value       = module.public_group.security_group_name
}


//aws private security group outputs
//private_sg_group_id
//private_sg_name
//private_sg_group_arn


output "private_sg_group_arn" {
  description = "The ARN of the security group"
  value       = module.private_group.security_group_arn
}

output "private_sg_group_id" {
  description = "The ID of the security group"
  value       = module.private_group.security_group_id
}

output "private_sg_group_name" {
  description = "The name of the security group"
  value       = module.private_group.security_group_name
}

