terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.59.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.8.1" # comment added in dev workspace
    }
   
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "mystorageacc"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"   # workspace ke naam ke saath suffix ho jaayega automatically
  }

}



