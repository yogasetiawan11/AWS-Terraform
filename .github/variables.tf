variable "region" {
    description = "The AWS region to deploy resources in"
    type        = string
    default     = "us-east-1"
}

variable "environment" {
    description = "The deployment environment e.g dev, staging, production"
    type        = string
    default     = "production"
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = "10.0.5.0/24"
  
}

variable "public_subnets_cidr" {
    description = "The CIDR block for the public subnet"
    type        = string
    default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidr" {
    description = "The CIDR block for the private subnet"
    type        = string
    default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "private_subnet_count" {
    description = "The number of private subnets to create"
    type        = number
    default     = 2
}

variable "medium_instance_type" {
    description = "Instance type for medium instances"
    type        = string
    default     = "t3.medium"
}

variable "desire_capacity" {
    description = "Desired capacity for auto-scaling group"
    type        = number
    default     = 2
}

variable "max_size" {
    description = "Maximum size for auto-scaling group"
    type        = number
    default     = 4
}
variable "min_size" {
    description = "Minimum size for auto-scaling group"
    type        = number
    default     = 2
}