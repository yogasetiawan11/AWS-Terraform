terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Create an S3 Bucket
resource "aws_s3_bucket" "tf_s3_bucket" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "Amazon-S3"
    Environment = "Dev"
  }
}