provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "my_vcluster" {
  name             = "my-vcluster"
  namespace        = "team-x"
  create_namespace = true

  repository       = "https://charts.loft.sh"
  chart            = "vcluster"

  # If you didn't create a vcluster.yaml, remove the values section.
  values = [
    file("${path.module}/vcluster.yaml")
  ]
}