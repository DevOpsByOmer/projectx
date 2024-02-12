# Autoscaling Notification
# AWS bug for sns topic https://stackoverflow.com/questions/62694223/cloudwatch-alarm-pending-confirmation
# due to this always create unique name\

# SNS topic
resource "aws_sns_topic" "myasg_sns_topic" {
  name = "myasg-sns-topic"
}

# SNS subscription
resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.myasg_sns_topic.arn
  protocol  = "email"
  endpoint  = "dvop.omer@gmail.com"
}
# create Autoscaling notification resource
resource "aws_autoscaling_notification" "myasg_notifications" {
  group_names = [aws_autoscaling_group.my_asg.id]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.myasg_sns_topic.arn
}
