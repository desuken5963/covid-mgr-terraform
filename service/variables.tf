variable "rails_master_key" {
  description = "Rails application master key"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database user"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

variable "db_port" {
  description = "Database port"
  type        = string
}

variable "db_host" {
  description = "Database host"
  type        = string
}

variable "awslogs_group" {
  description = "AWS logs group"
  type        = string
}

variable "awslogs_region" {
  description = "AWS logs region"
  type        = string
}

variable "awslogs_stream_prefix" {
  description = "AWS logs stream prefix"
  type        = string
}