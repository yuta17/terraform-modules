variable "name" {
  description = "ecr repository name"
  type        = string
  default     = null
}

variable "enable_scan_on_push" {
  type    = bool
  default = false
}
