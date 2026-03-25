variable "instance_names" {
    description = "List of EC2 instance names to create"
    type        = set(string)
    default     = ["Instance1", "Instance2", "Instance3"]
}