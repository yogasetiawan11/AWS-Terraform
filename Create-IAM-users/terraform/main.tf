resource "aws_iam_user" "users" {
  for_each = { for user in local.users : user.username => user }

  name = "${substr(each.value.first_name, 0, 1)}${each.value.last_name}"
  path = "/users/"

  tags = {
    "Display_name" = "${each.value.first_name} ${each.value.last_name}"
    "Department"   = each.value.department
    "Job_Title"    = each.value.job_title
  }
}

# Create IAM user login profile (password)
resource "aws_iam_user_login_profile" "login_profiles" {
    for_each = aws_iam_user.users

    user    = each.value.name
    password_reset_required = true

    lifecycle {
        ignore_changes = [
             "password_reset_required", 
             "password_length" 
             ] 
    }
}  
