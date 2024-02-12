locals {
  owners      = var.business_devision
  environment = var.environment
  name        = "${var.business_devision}-${var.environment}"
  #   name="${local.owners}-${local.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
  asg_tags = [
    {
      key                 = "Project-1"
      value               = "megasecret-1"
      propagate_at_launch = true
    },
    {
      key                 = "foo"
      value               = ""
      propagate_at_launch = true
    },
  ]
}