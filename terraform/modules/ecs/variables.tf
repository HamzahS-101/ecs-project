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

variable "private_subnet_ids" {
  type = list(string)
}

variable "container_security_group_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}