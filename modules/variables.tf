variable "region" {
  description = "Region name"
}

variable "desired_count" {
  description = "Number of tasks to run"
}

variable "release_version" {
  description = "Version of boron build"
}

variable "task_cpu" {
  description = "CPU hard limit"
}

variable "task_memory" {
  description = "Memory hard limit"
}

variable "task_subnet" {
  description = "subnet to launch the task"
}

variable "env_type" {
  type        = string
  description = "Environment type"
  default     = "dev"
}

variable "ecs_cluster" {
  default = "default"
}

variable "project_name" {
  default = null
}

variable "vpc_id" {
  default = null
}

variable "allowed_sg" {
  default = null
}

variable "service_discovery_id" {
  default = null
}

variable "postgres_engine_version" {
  default = null
}

variable "listenhost" {
  default = null
}

variable "listenport" {
  default = null
}

variable "docker_repo" {
  default = null
}