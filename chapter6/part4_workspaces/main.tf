terraform {
  backend "s3" {
    bucket         = "team-rocket-1d2yxrvx3fqa-state-bucket"
    key            = "team1/my-cool-project"
    region         = "eu-west-3"
    encrypt        = true
    #profile        = "swinkler" # this should be changed.
    role_arn       = "arn:aws:iam::606859348011:role/team-rocket-1d2yxrvx3fqa-tf-assume-role"
    dynamodb_table = "team-rocket-1d2yxrvx3fqa-state-lock"
  }
  required_version = ">= 0.15"
}

variable "region" {
  description = "AWS Region"
  type        = string
}

provider "aws" {
  region  = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = terraform.workspace
  }
}