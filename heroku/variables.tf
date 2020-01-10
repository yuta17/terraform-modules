variable "name" {
  description = "app name"
  type        = string
  default     = null
}

variable "region" {
  type    = string
  default = "us"
}

variable "config_vars" {
  type    = map(string)
  default = {}
}

variable "buildpacks" {
  type    = list(string)
  default = []
}

variable "database_plan" {
  type    = string
  default = null
}
