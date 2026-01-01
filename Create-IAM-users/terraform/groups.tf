resource "aws_iam_group" "junior_devops_group" {
    name = "junior_devops"
    path = "/groups/"
}

resource "aws_iam_group" "manager_group" {
    name = "manager"
    path = "/groups/"
}

resource "aws_iam_group_membership" "groups_membership" {
    name = "group-membership"
    group = aws_iam_group.junior_devops_group.name

    users = [
        for user in aws_iam_user.users : user.name if user.tags["Job_Title"] == "Junior DevOps Engineer" # Note: No users match this in the current CSV
    ]
 }