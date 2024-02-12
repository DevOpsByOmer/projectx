terraform {
  required_version = "~> v1.5"
  required_providers {
    aws = "~>5.0"
  }
}
provider "aws" {
  region = var.region
}
