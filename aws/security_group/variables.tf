variable "name" {
  type    = string
  default = null
}

variable "vpc_id" {
  type    = string
  default = null
}

variable "port" {
  type    = string
  default = null
}

variable "cidr_blocks" {
  type    = list(string)
  default = null
}
