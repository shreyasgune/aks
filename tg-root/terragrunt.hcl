terraform {
  # source = "tfr:///hashicorp/azurerm?version=3.84.0"
  source = "https://registry.terraform.io/providers/hashicorp/azurerm/3.84.0"
}

# Indicate what region to deploy the resources into
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
    # Configure the Microsoft Azure Provider
    provider "azurerm" {
    skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
    features {}
    
    }
    terraform{
      required_providers {
        azurerm = {
          source  = "hashicorp/azurerm"
          version = "~>3.0"
        }
        azapi = {
          source  = "azure/azapi"
          version = "~>1.5"
        }
        random = {
          source  = "hashicorp/random"
          version = "~>3.0"
        }
        time = {
          source  = "hashicorp/time"
          version = "0.9.1"
        }
      }
    }
     EOF
 }


remote_state {
  backend = "azurerm"
  config = {
    resource_group_name   = "sgune-rg"
    storage_account_name   = "sgunesa"
    container_name         = "tfstate"
    key                    = "${path_relative_to_include()}/terraform.tfstate"
  }
  generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}


locals {
    #azure region
    region = "US East"
    subscription_id   = get_env("ARM_SUBSCRIPTION_ID")
    tenant_id         = get_env("ARM_TENANT_ID")
    client_id         = get_env("ARM_CLIENT_ID")
    client_secret     = get_env("ARM_CLIENT_SECRET")
}
