variable "name" {
  type    = string
  default = null
}

variable "cpu" {
  type    = string
  default = null
}

variable "memory" {
  type    = string
  default = null
}

variable "security_group_id" {
  type    = string
  default = null
}

variable "private_subnet_ids" {
  type    = string
  default = null
}

variable "aws_lb_target_group_arn" {
  type    = string
  default = null
}

variable "container_definitions" {}

