terraform {
  required_version = ">= 0.15"
  required_providers {
    nomad = {
      source  = "hashicorp/nomad"
      version = "~> 1.4"
    }
  }
}

provider "nomad" { #A
  address = "http://terraforminaction-tfugqa-nomad-1679718768.us-west-2.elb.amazonaws.com:4646"
  alias   = "aws"
}

provider "nomad" { #A
  address = "http://terraforminaction-q2uqmd-nomad.centralus.cloudapp.azure.com:4646"
  alias   = "azure"
}

module "mmorpg" {
  source   = "terraform-in-action/mmorpg/nomad"
  fabio_db = "tcp://terraforminaction-q2uqmd-fabio.centralus.cloudapp.azure.com:27017" #B
  fabio_lb = "http://terraforminaction-tfugqa-fabio-eb9e44e8da7640e8.elb.us-west-2.amazonaws.com:9999" #B
  
  providers = {               #C                                                                        
    nomad.aws   = nomad.aws
    nomad.azure = nomad.azure
  }
}

output "browserquest_address" {
  value = module.mmorpg.browserquest_address
}
