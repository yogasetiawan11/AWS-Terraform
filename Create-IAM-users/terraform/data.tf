data "aws_caller_identity" "names" {}

output "name" {
    value = data.aws_caller_identity.names.user_id
}