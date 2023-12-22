# az ad sp create-for-rbac --name http://cert-manager --role "DNS Zone Contributor" --scopes /subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/resourceGroups/sgune-rg


resource "azurerm_role_assignment" "contributor_role" {
  principal_id = azuread_service_principal.service_principal.id
  role_definition_name = "DNS Zone Contributor"
  scope = var.resource_group_name
}

resource "azuread_service_principal" "service_principal" {
  application_id = var.application_id
}

resource "azuread_service_principal_password" "service_principal_password" {
  service_principal_id = azuread_service_principal.service_principal.id
  value               = var.client_secret
  end_date            = var.end_date
}

output "client_id" {
  value = azuread_service_principal.service_principal.application_id
}

output "client_secret" {
  value = azuread_service_principal_password.service_principal_password.value
}
