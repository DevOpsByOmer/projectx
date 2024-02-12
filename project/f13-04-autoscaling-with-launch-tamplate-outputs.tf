//launch Tamplate outputs

################################################################################
# Default
################################################################################

output "launch_template_id" {
  description = "The ID of the launch template"
  value       = aws_launch_template.my_launch_tamplate.id
}

output "launch_template_arn" {
  description = "The ARN of the launch template"
  value       = aws_launch_template.my_launch_tamplate.arn
}

output "launch_template_name" {
  description = "The name of the launch template"
  value       = aws_launch_template.my_launch_tamplate.name
}

output "template_latest_version" {
  description = "The latest version of the launch template"
  value       = aws_launch_template.my_launch_tamplate.latest_version
}

output "template_default_version" {
  description = "The.autoscaling version of the launch template"
  value       = aws_launch_template.my_launch_tamplate.default_version
}

//autoscaling group outputs

output "autoscaling_group_name" {
  description = "autoscaing group name"
  value       = aws_autoscaling_group.my_asg.name
}

output "autoscaling_group_arn" {
  description = "autoscaling group arn"
  value       = aws_autoscaling_group.my_asg.arn
}
output "autoscaling_group_id" {
  description = "auto scaling group id"
  value       = aws_autoscaling_group.my_asg.id
}
output "autoscaling_group_min_size" {
  description = "minimum size for auto scale up and down"
  value       = aws_autoscaling_group.my_asg.min_size
}
output "autoscaling_group_max_size" {
  description = "maximum size for autoscaling"
  value       = aws_autoscaling_group.my_asg.max_size
}
output "autoscaling_group_desired_capacity" {
  description = "autoscaling desired capacity"
  value       = aws_autoscaling_group.my_asg.desired_capacity
}
output "autoscaling_group_cooldown" {

  value = aws_autoscaling_group.my_asg.default_cooldown
}
output "autoscaling_group_health_check_grace_period" {
  value = aws_autoscaling_group.my_asg.health_check_grace_period
}
output "autoscaling_group_healyh_check_type" {
  value = aws_autoscaling_group.my_asg.health_check_type
}
