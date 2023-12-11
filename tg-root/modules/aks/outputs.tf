output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

# Define other outputs as needed
