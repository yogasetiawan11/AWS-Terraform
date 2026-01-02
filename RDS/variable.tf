variable "project_name" {
    description = "The name of the project."
    type        = string
    default     = "simple_rds_project"
}

variable "environment" {
    description = "The environment for the project."
    type        = string
    default     = "dev"
}

variable "aws_region" {
    description = "The AWS region to deploy resources in."
    type        = string
    default     = "us-west-2"
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC."
    type        = string
    default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "The CIDR block for the public subnet."
    type        = string
    default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
    description = "The CIDR block for the private subnet."
    type        = list(string)
    default     = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# RDS Variables
variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "webappdb"
}

variable "db_username" {
  description = "Database master username"
  type        = string
  default     = "admin"
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Allocated storage for RDS in GB"
  type        = number
  default     = 10
}

variable "db_engine_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}