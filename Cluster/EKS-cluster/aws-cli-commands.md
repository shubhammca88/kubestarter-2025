# AWS CLI Commands

Below are some commonly used AWS CLI commands for managing AWS resources.

## General Commands

```sh
# Configure AWS CLI
aws configure

# List all available AWS services
aws services list

# To see all configured profiles, run
aws configure list-profiles

# Show the AWS account ID, user ARN, and IAM role associated with your credentials.
aws sts get-caller-identity

# manually inspect the credentials stored in the AWS configuration files
cat ~/.aws/credentials
cat ~/.aws/config


# Get help for any AWS command
aws help
```

## S3 Commands

```sh
# List all S3 buckets
aws s3 ls

# Create a new S3 bucket
aws s3 mb s3://my-bucket-name

# Delete an S3 bucket
aws s3 rb s3://my-bucket-name

# Upload a file to an S3 bucket
aws s3 cp myfile.txt s3://my-bucket-name/

# Download a file from an S3 bucket
aws s3 cp s3://my-bucket-name/myfile.txt .

# Sync a local directory with an S3 bucket
aws s3 sync my-local-dir/ s3://my-bucket-name/
```

## EC2 Commands

```sh
# List all EC2 instances
aws ec2 describe-instances

# Start an EC2 instance
aws ec2 start-instances --instance-ids i-1234567890abcdef0

# Stop an EC2 instance
aws ec2 stop-instances --instance-ids i-1234567890abcdef0

# Terminate an EC2 instance
aws ec2 terminate-instances --instance-ids i-1234567890abcdef0
```

## IAM Commands

```sh
# List all IAM users
aws iam list-users

# Create a new IAM user
aws iam create-user --user-name my-user

# Delete an IAM user
aws iam delete-user --user-name my-user

# Attach a policy to an IAM user
aws iam attach-user-policy --user-name my-user --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
```

## EKS Commands

```sh
# List all EKS clusters
aws eks list-clusters

# Describe an EKS cluster
aws eks describe-cluster --name my-cluster

# Create a new EKS cluster
aws eks create-cluster --name my-cluster --role-arn arn:aws:iam::123456789012:role/EKSRole --resources-vpc-config subnetIds=subnet-12345678,subnet-87654321,securityGroupIds=sg-12345678

# Delete an EKS cluster
aws eks delete-cluster --name my-cluster
```

For more detailed information and additional commands, refer to the [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/).