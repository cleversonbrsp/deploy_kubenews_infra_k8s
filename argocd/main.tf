# Configuração do provider Kubernetes para conectar ao cluster
provider "kubernetes" {
  config_path    = var.kubeconfig_path # Caminho para o arquivo kubeconfig
  config_context = var.kube_context   # Nome do contexto do cluster Kubernetes
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

# Recurso para carregar o manifesto do ArgoCD a partir de um arquivo local
data "local_file" "argocd_manifest" {
  filename = "${path.module}/install.yaml" # Caminho para o arquivo local
}

# Recurso para aplicar o manifesto do ArgoCD
resource "kubernetes_manifest" "argocd_install" {
  depends_on = [kubernetes_namespace.argocd]
  # Divide múltiplos documentos YAML em partes
  for_each = toset(split("---", data.local_file.argocd_manifest.content))

  manifest = yamldecode(each.value) # Decodifica cada documento YAML separadamente
}