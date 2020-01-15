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
  // type    = list
  default = []
}

variable "security_groups" {
  // type    = list
  default = []
}

variable "bucket_id" {
  type    = string
  default = null
}

variable "access_logs_enabled" {
  type    = bool
  default = true
}

variable "http_port" {
  type    = string
  default = 80
}

variable "http_protocol" {
  type    = string
  default = "HTTP"
}
