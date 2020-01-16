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

variable "certificate_resource_record_name" {
  type    = string
  default = null
}

variable "certificate_resource_record_type" {
  type    = string
  default = null
}

variable "certificate_resource_record_value" {
  type    = string
  default = null
}
