resource "aws_cloudwatch_metric_alarm" "Usage_Alarm_Ec2" {
  alarm_name          = "Usage_Alarm_Ec2"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  alarm_actions       = ["arn:aws:sns:us-east-1:123456789012:my_sns_topic"]
  treat_missing_data  = "notBreaching"

}

resource "aws_cloudwatch_query_definition" "demo_def" {
  name = "demo_def"

  log_group_names = [
    "logs"

  ]
  query_string = <<EOF
    fields @timestamp, @message
    | filter @message like /ERROR/
    | sort @timestamp desc
    | limit 10
    EOF

}