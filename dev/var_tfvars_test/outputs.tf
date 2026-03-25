output "instance_name" {
  description = "The name of the EC2 instance created using local variable"
  value       = aws_instance.var_test_instance.tags["Name"]
}
