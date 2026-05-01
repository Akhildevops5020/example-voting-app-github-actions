# AKS Infrastructure

This Terraform creates an AKS cluster and gives it `AcrPull` permission on the Azure Container Registry.

## GitHub Actions

```text
.github/workflows/infra.yml
```

It can use an existing ACR by keeping `create_acr` as `false`.

## Local Terraform Usage

```bash
cd infra/terraform/aks
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```

For an existing ACR, set:

```hcl
create_acr              = false
acr_name                = "azureakhilcicd"
acr_resource_group_name = "<resource-group-containing-acr>"
```

## Deploy App After AKS Is Ready

From the repository root:

```bash
export AKS_RESOURCE_GROUP="Voting-k8_group"
export AKS_CLUSTER_NAME="voting-8"
export IMAGE_TAG="latest"

bash scripts/deploy-to-aks.sh
```

The deploy script applies `k8s-specifications/`, then updates the `vote`, `result`, and `worker` deployments to use images from ACR.
