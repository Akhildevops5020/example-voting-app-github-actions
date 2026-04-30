# AKS Infrastructure

This Terraform creates an AKS cluster and gives it `AcrPull` permission on the Azure Container Registry.

The GitHub Actions workflow is:

```text
.github/workflows/infra.yml
```

It can use an existing ACR by keeping `create_acr` as `false`.
