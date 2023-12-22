# this needs to be sorted out properly. Its got bugs in it at this time.
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config" # Specify your kubeconfig path
  }

    experiments {
        manifest = true
  }
}

resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  repository = "/home/sgune/codebase/aks/helm-stuff/bootstraper/charts"  # Path to your Helm chart directory
  chart      = "cert-manager"
  cleanup_on_fail = true
  create_namespace = true
    values = [
    file("/home/sgune/codebase/aks/helm-stuff/bootstraper/charts/cert-manager/Values.yaml")
  ]

}
