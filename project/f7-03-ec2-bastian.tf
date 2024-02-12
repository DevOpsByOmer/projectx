//aws ec2 bastion host for jumpserver for public subnet
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  name = "${local.environment}-bastion-server"

  ami           = data.aws_ami.amazon_linux2.id
  instance_type = var.instance_type
  key_name      = var.instance-key-pair
  //monitoring             = true
  vpc_security_group_ids = [module.public_group.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  user_data = file("${path.module}/jumpbox-install.sh")

  tags = local.common_tags
}