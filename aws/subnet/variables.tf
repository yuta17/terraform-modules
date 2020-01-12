variable "vpc_id" {
  type    = string
  default = null
}

variable "public_cidr_blocks" {
  type    = list(string)
  default = []
}

variable "private_cidr_blocks" {
  type    = list(string)
  default = []
}

variable "availability_zones" {
  type    = list(string)
  default = []
}

variable "public_subnet_ids" {
  type    = list(string)
  default = []
}

variable "nat_gateways_count" {
  type    = number
  default = 2
}

variable "tags" {
  type    = map(string)
  default = {}
}
