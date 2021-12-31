provider "aws" {
  region  = "eu-west-3"
}

module "s3backend" {
  source ="github.com/LOGRUSFR/terraform-aws-s3backend"
  namespace = "team-rocket"
}

output "s3backend_config" {
  value = module.s3backend.config
}