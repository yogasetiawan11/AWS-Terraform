terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
    use_locking = true      # S3 Native Locking (No DynamoDB needed)
    encrypt = true
  }
}
