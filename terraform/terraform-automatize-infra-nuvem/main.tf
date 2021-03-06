terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}  

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-0e472ba40eb589f49"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }
}