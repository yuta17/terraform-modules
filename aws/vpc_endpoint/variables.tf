variable "vpc_id" {
  type    = string
  default = null
}

variable "private_route_table_ids" {
  type    = list(string)
  default = []
}

variable "private_subnet_ids" {
  type    = list(string)
  default = []
}

variable "ecr_dkr_endpoint_security_group_ids" {
  type    = list(string)
  default = []
}

variable "logs_endpoint_security_group_ids" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
