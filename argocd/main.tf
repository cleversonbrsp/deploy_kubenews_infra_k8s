# Configuração do provider Kubernetes para conectar ao cluster
provider "kubernetes" {
  config_path    = var.kubeconfig_path # Caminho para o arquivo kubeconfig
  config_context = var.kube_context # Nome do contexto do cluster Kubernetes
}

# Recurso para buscar o YAML remoto do ArgoCD
data "http" "argocd_manifest" {
  url = "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"
}

# Recurso para aplicar o manifesto do ArgoCD
resource "kubernetes_manifest" "argocd_install" {
  manifest = yamldecode(data.http.argocd_manifest.body) # Decodifica o YAML remoto
}
