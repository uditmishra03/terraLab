output "ec2_instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = aws_instance.ec2_instance.*.id
}

output "outside_ec2_instance_id" {
  description = "ID of the EC2 instance created outside of count"
  value       = aws_instance.outside_tf.id
}