terraform {
  required_version = "~> v1.1.7"
  required_providers {
    aws = "~>5.0"
  }
}
provider "aws" {
  region = var.region
}
