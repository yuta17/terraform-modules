variable "name" {
  type    = string
  default = null
}

variable "load_balancer_type" {
  type    = string
  default = null
}

variable "internal" {
  type    = bool
  default = false
}

variable "idle_timeout" {
  type    = number
  default = 60
}

variable "enable_deletion_protection" {
  type    = bool
  default = true
}

variable "public_subnet_ids" {
  type    = list(string)
  default = []
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "certificate_arn" {
  type    = string
  default = null
}

variable "vpc_id" {
  type    = string
  default = null
}
