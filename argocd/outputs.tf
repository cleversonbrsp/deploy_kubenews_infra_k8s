# Saída para confirmar que o ArgoCD foi instalado
output "argocd_namespace" {
  value       = "argocd"
  description = "Namespace onde o ArgoCD foi instalado."
}

# Saída: URL do servidor ArgoCD
output "argocd_server_url" {
  value       = "http://${helm_release.argocd.name}.${var.argocd_namespace}.svc.cluster.local"
  description = "URL para acessar o ArgoCD dentro do cluster Kubernetes"
}

# Saída: Nome do namespace do ArgoCD
output "argocd_namespace" {
  value       = var.argocd_namespace
  description = "Namespace onde o ArgoCD foi instalado"
}
