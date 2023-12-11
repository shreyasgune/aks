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
    EOF
}

remote_state {
  backend = "azurerm"
  config = {
    resource_group_name   = "sgune-rg"
    storage_account_name   = "sgune-sa"
    container_name         = "tfstate"
    key                    = "${path_relative_to_include()}/terraform.tfstate"
  }
}
