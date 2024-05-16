terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
}

# Provide Authentication here

provider "aws" {
                       
                        # Configuration options dont provide access keys if you want to push public git hubs.
 region = "us-east-1"

}