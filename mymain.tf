terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

resource "aws_instance" "linux_server" {
  ami           = "ami-095f43e3467d7ee9393"
  instance_type = "t2.micro"

  tags = {
    Name = "My first machine"
  }
}
