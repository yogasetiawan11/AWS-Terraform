# Prerequisites
- Create AWS Account: Sign up for AWS free tier if you don't have an account
- Install AWS CLI: Download and install from AWS official website
- Configure Credentials: Set up your AWS access keys

## 1. AWS CLI Installation
Check your system architecture first:

```sh
# Linux/macOS
uname -m

# Windows PowerShell
$env:PROCESSOR_ARCHITECTURE

```

Download Amazon CLI from Official Website: https://aws.amazon.com/cli/


## 2. Authentication Setup
- Method 1: AWS CLI Configuration
```bash
aws configure
```

Enter your:

- AWS Access Key ID
- AWS Secret Access Key
- Default region (e.g., us-east-1)
- Default output format (json)

```sh
# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Plan changes
terraform plan

# Apply changes
terraform apply

# Show current state
terraform show

# Destroy resources
terraform destroy
```


## Important Notes
- Resource Names: S3 bucket names must be globally unique
- Regions: Ensure you're working in your intended AWS region
- Costs: Monitor AWS costs, even in free tier
- Cleanup: Always destroy resources when done practicing

## Troubleshooting Tips
- Check AWS credentials are properly configured
- Verify region settings match your intended deployment location
- Ensure S3 bucket names are unique and follow naming conventions
- Review AWS CloudTrail for API call logs if needed

