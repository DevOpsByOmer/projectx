//security group for classic Loadbalancer 

module "rdsdb-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name                = "rdsdb-sg"
  description         = "security group with http & open for entire ingress and egress port all-all)"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]


  ingress_with_cidr_blocks = [

    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "mysql access within vpc"
      cidr_blocks = module.vpc.vpc_cidr_block
    },

  ]
  egress_rules = ["all-all"]
  tags         = local.common_tags

}