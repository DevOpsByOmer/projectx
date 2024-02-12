//aws ec2 Security group terraform module
//security group for public jumpserver

module "public_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "public-bastion-sg"
  description = "security group with ssh open for all engress ports and for ingress (ssh and http)"
  vpc_id      = module.vpc.vpc_id
  //ingree Rules and Cidr Block

  ingress_rules = ["ssh-tcp"]


  ingress_cidr_blocks = ["0.0.0.0/0"]
  //engress Rules allowd for all-all  open
  egress_rules = ["all-all"]
  tags         = local.common_tags
}