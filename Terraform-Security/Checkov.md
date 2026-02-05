## What is Checkov
Checkov is a utility used to identify insecure Terraform files or configurations.

Checkov solves Problems with an example:

A junior DevOps engineer might create an S3 bucket using Terraform that is syntactically correct, but they could unintentionally make it public.
Even pre-commit hooks or Git leaks wouldn't catch this because the Terraform code itself isn't leaking secrets, it's a misconfiguration that leads to insecure infrastructure.

## How Checkov helps:

It functions like a test suite for your Terraform code, but you don't need to write the test cases yourself .
When run, Checkov analyzes your Terraform configuration and automatically performs checks relevant to the resources you're defining.
It identifies specific security bad practices, such as "Ensure S3 bucket has public ACL enabled" or "Ensure S3 bucket has block public policy enabled".

Checkov can be integrated into your development workflo Engineers can run it locally before committing their code.
## Step 1: Install Checkov
```sh
pip install checkov
```
Verify:
```sh
checkov --version
```

## Step 2: Create Insecure Terraform Code
```sh
mkdir terraform-checkov-demo
cd terraform-checkov-demo
```

Create main.tf (INSECURE ON PURPOSE):
```sh
cat <<EOF > main.tf

resource "aws_s3_bucket" "public_bucket" {
  bucket = "my-public-demo-bucket"
}

resource "aws_s3_bucket_acl" "public_acl" {
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.public_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

EOF
```


## Step 3: Scan with Checkov
```sh
checkov -d ./path/to/your/tf.file
```

It can also be integrated into CI/CD pipelines (e.g., GitHub Actions) to validate Terraform configurations automatically whenever code is pushed to a repository 

Terraform builds infrastructure. Checkov secures it before deployment.

