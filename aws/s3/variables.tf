variable "bucket" {
  type    = string
  default = null
}

variable "acl" {
  type    = string
  default = "private"
}

variable "policy" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
