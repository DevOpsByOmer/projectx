# Create Schedule Action-1 increase instance capacity During Busness hours
resource "aws_autoscaling_schedule" "increase_capacity_from_9am" {
  scheduled_action_name  = "increase-capacity-from-9am"
  min_size               = 2
  max_size               = 5
  desired_capacity       = 2
  start_time             = "2030-12-11T18:00:00Z"
  recurrence             = "00 09 * * *     "
  autoscaling_group_name = aws_autoscaling_group.my_asg.id
}

# Create Schedule Action-2 decrease instance capacity During non busness hours

resource "aws_autoscaling_schedule" "decrease_capacity_from_9pm" {
  scheduled_action_name  = "decrease-capacity-from-9pm"
  min_size               = 2
  max_size               = 5
  desired_capacity       = 2
  start_time             = "2030-12-12T18:00:00Z"
  recurrence             = "00 09 * * *     "
  autoscaling_group_name = aws_autoscaling_group.my_asg.id
}