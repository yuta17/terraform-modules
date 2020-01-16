variable "name" {
  description = "domain name"
  type        = string
  default     = null
}

variable "alb_dns_name" {
  type    = string
  default = null
}

variable "alb_zone_id" {
  type    = string
  default = null
}
