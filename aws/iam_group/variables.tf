variable "name" {
  type = string
  default = ""
}

variable "use_policy" {
  type    = number
  default = 1
}

variable "policy" {
  type        = string
  default     = ""
}

variable "membership_users" {
  type        = list(string)
  default     = []
}
