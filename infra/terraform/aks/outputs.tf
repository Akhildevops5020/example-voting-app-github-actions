output "aks_cluster_name" {
  description = "AKS cluster name."
  value       = azurerm_kubernetes_cluster.this.name
}

output "aks_resource_group_name" {
  description = "AKS resource group name."
  value       = azurerm_resource_group.this.name
}

output "acr_login_server" {
  description = "ACR login server used by AKS."
  value       = local.acr_login_server
}
