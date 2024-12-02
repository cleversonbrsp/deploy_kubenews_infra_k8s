# Variável para o namespace onde o ArgoCD será instalado
variable "argocd_namespace" {
  default     = "argocd" # Valor padrão
  description = "Namespace para o ArgoCD"
}

# Variável para a versão do ArgoCD
variable "argocd_version" {
  default     = "5.36.1" # Valor padrão da versão
  description = "Versão do ArgoCD a ser instalada"
}

# Caminho do kubeconfig
variable "kubeconfig_path" {
  default     = "~/.kube/config"
  description = "Caminho para o arquivo kubeconfig"
}

# Contexto do cluster Kubernetes
variable "kube_context" {
  default     = "seu-contexto-do-cluster"
  description = "Contexto do cluster Kubernetes no kubeconfig"
}
