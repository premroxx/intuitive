variable "App" {
  type        = string
  description = "Name of App this EC2 is meant to house"
}

variable "environment" {
  type        = string
  description = "Name of environment this EC2 is targeting"
}

variable "ec2_count" {
  default = 2
  type = number
  description = "Server Number"
}

variable "ami_id" {
  default = "ami-04f80c5df86afb1df"
  type = string
  description = "default Nginx AMI"
}

variable "instance_type" {
  default = "t2.micro"
  type = string
  description = "Type of EC2 to be used"
}

variable "vpc_id" {
  type = string
  description = "VPC for this EC2"
}

variable "public_subnet_id" {
  type = string
  description = "Public Subnet for EC2"
}

variable "security_group_id" {
  type = string
  description = "SG to be Associated to EC2"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the EC2 resources"
}