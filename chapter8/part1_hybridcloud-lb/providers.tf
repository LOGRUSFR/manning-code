provider "aws" {
  profile = "fd-aws-2"
  region  = "eu-west-3"
}

provider "azurerm" {
  features {}
}

provider "google" {
  project = "51814952948"
  region  = "europe-west1"
}

provider "docker" {} #A
