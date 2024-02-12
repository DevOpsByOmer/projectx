//aws ec2 Security group terraform module
//security group for public jumpserver
module "private_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"


  name                = "private-sg"
  description         = "security group with http & ssh open for entire vpc Block and for ingress (ssh and http)"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["10.0.0.0/16"]

  //ingree Rules and Cidr Block
  ingress_rules = ["ssh-tcp", "http-80-tcp", "http-8080-tcp"]
  //engress Rules allowd for all-all  open
  egress_rules = ["all-all"]
  tags         = local.common_tags
}