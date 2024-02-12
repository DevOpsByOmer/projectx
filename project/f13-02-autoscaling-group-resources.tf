resource "aws_autoscaling_group" "my_asg" {
  name                = "my-asg"
  max_size            = 5
  min_size            = 2
  desired_capacity    = 2
  vpc_zone_identifier = module.vpc.private_subnets

  #  associate ALB Target arn
  target_group_arns = module.alb.target_group_arns
  # associate launch tamplete
  launch_template {
    id      = aws_launch_template.my_launch_tamplate.id
    version = aws_launch_template.my_launch_tamplate.latest_version
  }
  instance_refresh {
    strategy = "Rolling"
    preferences {
      # instance_warmup =300 default  behavior is  to use  the autoscaling health check
      min_healthy_percentage = 50
    }
    triggers = ["desired_capacity"] //you can add any argument from ASG
  }
  tag {
    key                 = "owner"
    value               = "web-T"
    propagate_at_launch = true
  }
}