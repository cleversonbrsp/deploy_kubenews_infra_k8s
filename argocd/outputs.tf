# Saída para confirmar que o ArgoCD foi instalado
output "argocd_namespace" {
  value       = "argocd"
  description = "Namespace onde o ArgoCD foi instalado."
}

output "argocd_server_url" {
  description = "URL do servidor ArgoCD"
  value       = "http://argocd-server.${var.argocd_namespace}.svc.cluster.local"
}

