//elastic ip resource creation

# resource "aws_eip" "bastion_eip" {
#   depends_on = [module.ec2_public, module.vpc]
#   instance   = module.ec2_public.id[0]
#   vpc        = true
#   tags       = local.common_tags

# }
resource "aws_eip" "bastion_eip" {
  depends_on = [module.ec2_public, module.vpc]
  instance   = module.ec2_public.id
  domain     = "vpc" # Use "vpc" to indicate VPC EIP
  tags       = local.common_tags
}
