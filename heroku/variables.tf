variable "name" {
  description = "app name"
  type        = string
  default     = null
}

variable "region" {
  type    = string
  default = "us"
}

variable "acm" {
  type    = bool
  default = false
}

variable "config_vars" {
  type    = map(string)
  default = {}
}

variable "sensitive_config_vars" {
  type    = map(string)
  default = {}
}

variable "buildpacks" {
  type    = list(string)
  default = []
}

variable "plan_name" {
  type    = string
  default = null
}
