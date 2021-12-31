terraform {
  backend "s3" {
    bucket         = "team-rocket-1d2yxrvx3fqa-state-bucket"
    key            = "jesse/james"
    region         = "eu-west-3"
    encrypt        = true
    #profile        = "swinkler" # this should be changed.
    role_arn       = "arn:aws:iam::606859348011:role/team-rocket-1d2yxrvx3fqa-tf-assume-role"
    dynamodb_table = "team-rocket-1d2yxrvx3fqa-state-lock"
  }
  required_version = ">= 0.15"
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

resource "null_resource" "motto" {
  triggers = {
    always = timestamp()
  }
  provisioner "local-exec" {
    command = "echo GOTTA CATCH EM ALL" #A
  }
}
