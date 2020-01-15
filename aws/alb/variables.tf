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

variable "http_port" {
  type    = string
  default = 80
}

variable "http_protocol" {
  type    = string
  default = "HTTP"
}
