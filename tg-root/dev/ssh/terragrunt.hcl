include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../modules/ssh"
}

inputs = {
    location = "eastus"
    rg_id = "/subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/resourceGroups/sgune-rg"
}