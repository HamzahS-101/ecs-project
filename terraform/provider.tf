terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.89.0"
    }
    time = {
        source = "hashicorp/time"
        version = "~> 0.10.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

provider "time" {}