# terraform.tfvars
pm_api_token_id     = ""
pm_api_token_secret = ""
cipassword          = "password-vm"

virtual_machines = {
      "vm1" = {
    name        = "NAMEOFTHEVM"
    vmid        = 7777
    ipconfig    = "IP"
    tags        = "openstack,compute3"
    target_node = "proxmox6"
    cores       = 
    sockets     = 
    memory      = #in MB
    disk1_size  = #in GB
  },
  # you can add more vms
}
