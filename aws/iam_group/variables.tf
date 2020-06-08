variable "name" {
  type = string
  default = ""
}

variable "use_policy" {
  type    = number
  default = 0
}

variable "policy" {
  type        = string
  default     = ""
}

variable "membership_users" {
  type        = list(string)
  default     = []
}
