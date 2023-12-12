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
      node_count = "3"
      username = "sgune" 
      sshkey = dependency.ssh.outputs.key_data
      vm_size = "Standard_D2_v2" 
}