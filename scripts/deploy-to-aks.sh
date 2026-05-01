#!/usr/bin/env bash
set -euo pipefail

AKS_RESOURCE_GROUP="${AKS_RESOURCE_GROUP:-Voting-k8_group}"
AKS_CLUSTER_NAME="${AKS_CLUSTER_NAME:-voting-8}"
K8S_NAMESPACE="${K8S_NAMESPACE:-default}"
ACR_LOGIN_SERVER="${ACR_LOGIN_SERVER:-azureakhilcicd.azurecr.io}"
IMAGE_PREFIX="${IMAGE_PREFIX:-example-voting-app}"
IMAGE_TAG="${IMAGE_TAG:-latest}"

az aks get-credentials \
  --resource-group "$AKS_RESOURCE_GROUP" \
  --name "$AKS_CLUSTER_NAME" \
  --overwrite-existing

kubectl apply -n "$K8S_NAMESPACE" -f k8s-specifications/

kubectl set image deployment/vote \
  vote="$ACR_LOGIN_SERVER/$IMAGE_PREFIX/vote:$IMAGE_TAG" \
  -n "$K8S_NAMESPACE"

kubectl set image deployment/result \
  result="$ACR_LOGIN_SERVER/$IMAGE_PREFIX/result:$IMAGE_TAG" \
  -n "$K8S_NAMESPACE"

kubectl set image deployment/worker \
  worker="$ACR_LOGIN_SERVER/$IMAGE_PREFIX/worker:$IMAGE_TAG" \
  -n "$K8S_NAMESPACE"

kubectl rollout status deployment/vote -n "$K8S_NAMESPACE" --timeout=180s
kubectl rollout status deployment/result -n "$K8S_NAMESPACE" --timeout=180s
kubectl rollout status deployment/worker -n "$K8S_NAMESPACE" --timeout=180s

kubectl get pods -n "$K8S_NAMESPACE"
kubectl get services -n "$K8S_NAMESPACE"

