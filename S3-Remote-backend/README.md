# How Terraform Updates Infrastructure
- Goal: Keep actual state same as desired state
- State File: Actual state resides in terraform.tfstate file
- Process: Terraform compares current state with desired configuration
- Updates: Only changes the resources that need modification

# Terraform State File
The state file is a JSON file that contains:

- Resource metadata and current configuration
- Resource dependencies
- Provider information
- Resource attribute values
- State File Best Practices
- Never edit state file manually
- Store state file remotely (not in local file system)
- Enable state locking to prevent concurrent modifications
Backup state files regularly
- Use separate state files for different environments
- Restrict access to state files (contains sensitive data)
- Encrypt state files at rest and in transit


# AWS Remote Backend Components
- S3 Bucket: Stores the state file
- S3 Native State Locking: Uses S3 conditional writes for locking (introduced in Terraform 1.10)
- IAM Policies: Control access to backend resources


# What is S3 Native State Locking?
Starting with Terraform 1.10 (released in 2024), you no longer need DynamoDB for state locking. Terraform now supports S3 native state locking using Amazon S3's Conditional Writes feature.

# How It Works
S3 native state locking uses the If-None-Match HTTP header to implement atomic operations:

When Terraform needs to acquire a lock, it attempts to create a lock file in S3
- S3 conditional writes check if the lock file already exists
- If the lock file exists, the write operation fails, preventing concurrent modifications
- If the lock file doesn't exist, it's created successfully and the lock is acquired
- When the operation completes, the lock file is deleted (appears as a delete marker with versioning)

## Previous Method (DynamoDB):

- Required separate DynamoDB table creation
- Additional AWS service to monitor and maintain
- More complex IAM permissions
- Extra cost for DynamoDB read/write operations
- DynamoDB state locking is now discouraged and may be deprecated in future Terraform versions


# Practice
Setup Remote Backend
Step 1: Create S3 Bucket for State Storage
Create an S3 bucket with versioning and encryption enabled to store Terraform state files.You can use the test.sh script provided in the code folder to do it quickly using AWS CLI.
```bash
Configuration Example
terraform {
  backend "s3" {
    bucket       = "your-terraform-state-bucket"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}
```
Key Parameters:

- bucket: S3 bucket name for state storage
- key: Path within the bucket where state file will be stored
- region: AWS region for the S3 bucket
- use_lockfile: Enable S3 native state locking (set to true)
- encrypt: Enable server-side encryption for the state file
- Important: S3 versioning MUST be enabled for S3 native state locking to work properly.

