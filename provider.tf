terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
  }
}
provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "alma-dev-tf-state-bucket"
    key = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "alma-dynamodb-table"
  }
}
