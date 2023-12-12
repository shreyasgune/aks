include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../modules/aks"
}

dependency "ssh" {
  config_path = "../ssh"
}

inputs = {
      resource_group_name = "sgune-rg"
      location = "eastus"
      cluster_name = "sgune-aks-cluster"
      node_count = "2" # cuz i ran into quota issues. free tier only allows 4 cores per region
      username = "sgune" 
      sshkey = dependency.ssh.outputs.key_data
      vm_size = "Standard_D2a_v4" # I chose this vm flavour because https://azureprice.net/vm/Standard_D2a_v4
}