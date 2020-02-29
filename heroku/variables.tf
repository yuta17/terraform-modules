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
  type = bool
  default = false
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
  default = "heroku-postgresql:hobby-dev"
}

variable "database_count" {
  type    = number
  default = 1
}

variable "sendgrid_plan" {
  type    = string
  default = "sendgrid:starter"
}

variable "sendgrid_count" {
  type    = number
  default = 0
}
