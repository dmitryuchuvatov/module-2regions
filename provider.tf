terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# We initialize a provider
provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

# We create a new provider using alias london
provider "aws" {
  alias  = "london"
  region = "eu-west-2"
}