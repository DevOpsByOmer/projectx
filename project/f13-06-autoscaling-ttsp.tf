# TTS - Scaling policy-1 : based on CPU utilization of  EC2 instance
# Define Autoscaling policies and Associate them to  Autoscaling group
resource "aws_autoscaling_policy" "avrage_cpu_policy_greater_then_2" {
  name                   = "avrage-cpu-policy-greater-then-2"
  policy_type            = "TargetTrackingScaling"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.my_asg.id

  estimated_instance_warmup = 180
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label         = "${module.alb.lb_arn_suffix}/${module.alb.target_group_arn_suffixes[0]}"
    }

    target_value = 10.0
  }

}

# TTS -Scaling Ploicy-2: Based on ALB Target requests
resource "aws_autoscaling_policy" "alb_target_requests_greater_then_2" {
  name                   = "alb-target-requests-greater-then-2"
  policy_type            = "TargetTrackingScaling"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.my_asg.id

  estimated_instance_warmup = 180
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }

}