variable "alb_name" {
  type = string
}

variable "alb_security_group_id" {
  type = string
}

variable "alb_subnet_ids" {
  type = list(string)
}

variable "target_group_name" {
  type = string
}

variable "target_group_port" {
  type = number
}

variable "target_group_protocol" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "acm_certificate_arn" {
  type = string
}

