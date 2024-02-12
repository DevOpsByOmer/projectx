variable "vpc_name" {
  description = "my vpc name here"
  type        = string
  default     = "myvpc"

}
variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}
variable "azs" {
  description = "my availabilty zones here"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]

}
variable "private_subnets" {
  description = "private subnet details here"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

}
variable "public_subnets" {
  description = "public subnet details here"
  type        = list(string)
  default     = ["10.0.100.0/24", "10.0.101.0/24"]

}
variable "database_subnets" {
  description = "database subnet details here"
  type        = list(string)
  default     = ["10.0.103.0/24", "10.0.104.0/24"]
}
variable "create_database_subnet_group" {
  type    = bool
  default = true

}
variable "create_database_nat_gateway_route" {
  type    = bool
  default = true

}
variable "create_database_subnet_route_table" {
  type    = bool
  default = true

}
variable "enable_nat_gateway" {
  type    = bool
  default = true
}
variable "single_nat_gateway" {
  type    = bool
  default = true
}
variable "vpc_tags" {
  type    = string
  default = "myvpc-for-dev"

}
  