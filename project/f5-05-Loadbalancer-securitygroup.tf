//security group for classic Loadbalancer 

module "Loadbalancer_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name                = "loadbalancer-sg"
  description         = "security group with http & open for entire ingress and egress port all-all)"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]

  //ingree Rules and Cidr Block
  ingress_rules = ["http-80-tcp", "https-443-tcp"]
  //engress Rules allowd for all-all  open
  egress_rules = ["all-all"]
  tags         = local.common_tags
  ingress_with_cidr_blocks = [

    {
      from_port   = 81
      to_port     = 81
      protocol    = 6
      description = "Allow all to port 81 from internet"
      cidr_blocks = "0.0.0.0/0"
    },

  ]
}