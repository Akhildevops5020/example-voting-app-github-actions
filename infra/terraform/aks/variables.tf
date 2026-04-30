variable "resource_group_name" {
  description = "Azure resource group name for AKS."
  type        = string
}

variable "location" {
  description = "Azure region for AKS."
  type        = string
}

variable "aks_cluster_name" {
  description = "AKS cluster name."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
  default     = "voting-app"
}

variable "kubernetes_version" {
  description = "AKS Kubernetes version. Leave empty to use Azure default."
  type        = string
  default     = ""
}

variable "node_count" {
  description = "Number of nodes in the default node pool."
  type        = number
  default     = 2
}

variable "node_vm_size" {
  description = "VM size for AKS nodes."
  type        = string
  default     = "Standard_B2s"
}

variable "acr_name" {
  description = "Azure Container Registry name without .azurecr.io."
  type        = string
}

variable "acr_resource_group_name" {
  description = "Resource group containing the existing ACR. Ignored when create_acr is true."
  type        = string
}

variable "create_acr" {
  description = "Create a new ACR. If false, use an existing ACR."
  type        = bool
  default     = false
}

variable "acr_sku" {
  description = "ACR SKU when create_acr is true."
  type        = string
  default     = "Basic"
}
