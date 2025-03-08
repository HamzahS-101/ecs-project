variable "alb_sg_name" {
  type = string
}

variable "alb_sg_description" {
  type = string
}

variable "container_sg_name" {
  type = string
}

variable "container_sg_description" {
  type = string
}

variable "container_ingress_port" {
  type = number
}

variable "vpc_id" {
  type = string
}