terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAX53T7J3SO7EGZ7MQ"
  secret_key = "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"
}

# resource "aws_instance" "ec2" {
#     ami = "ami-08a52ddb321b32a8c"
#     instance_type = "t2.micro" 
#     count = 3
#   } 

variable "names" {
    type = list
    default = ["dev","stage","prod"]
}

resource "aws_iam_user" "lb" {
  name = var.names[count.index]
  count = 3
  path = "/system/"
}  

# resource "aws_instance" "ec22" {
#     ami = "ami-08a52ddb321b32a8c"
#     instance_type = "t2.micro"
#   } 

# resource "aws_instance" "ec21" {
#     ami = "ami-08a52ddb321b32a8c"
#     instance_type = "t2.micro"
#   } 
