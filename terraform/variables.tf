#VPC
variable "vpc_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}

variable "availability_zone_a" {
  type = string
}

variable "availability_zone_b" {
  type = string
}

variable "region" {
  type = string
}


# Security Groups

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

# ALB and target group

variable "alb_name" {
  type = string
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

# Route53

variable "domain_name" {
  type = string
}

variable "hosted_zone_domain" {
  type = string
}

variable "record_name" {
  type = string
}

# ECS

variable "cluster_name" {
  type = string
}

variable "iam_role_name" {
  type = string
}

variable "iam_policy_name" {
  type = string
}

variable "task_definition_family" {
  type = string
}

variable "task_cpu" {
  type = number
}

variable "task_memory" {
  type = number
}

variable "container_name" {
  type = string
}

variable "docker_image" {
  type = string
}

variable "container_cpu" {
  type = number
}

variable "container_memory" {
  type = number
}

variable "container_port" {
  type = number
}

variable "service_name" {
  type = string
}

variable "desired_count" {
  type = number
}