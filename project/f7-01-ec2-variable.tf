variable "instance_type" {
  description = "Ec2 instance type"
  type        = string
  default     = "t2.micro"

}
variable "instance-key-pair" {
  type = string

}
variable "instance_count" {
  type = number

}


