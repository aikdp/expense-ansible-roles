terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }

    # backend "s3" {
    #     bucket = "expense-ansible-ec2"
    #     key = "ansible-dev"
    #     region = "us-east-1"
    #     dynamodb_table = "loking-ansible"
    # }
}

provider "aws" {
    region = "us-east-1"
}

