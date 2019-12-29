variable "bucket" {
  type = string
  default = null
}

variable "acl" {
  type = string
  default = "private"
}

variable "tags" {
  type = map(string)
  default = {}
}
