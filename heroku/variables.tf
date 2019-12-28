variable "name" {
  type = string
  description = "app name"
}

variable "region" {
  type = string
  default = "us"
}

variable "config_vars" {
  type = map(string)
  default = {}
}

variable "buildpacks" {
  type = list(string)
  default = []
}

variable "database_plan" {
  type = string
  default = "heroku-postgresql:hobby-dev"
}
