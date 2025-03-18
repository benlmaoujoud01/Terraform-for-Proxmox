
output "vm_details" {
  description = "Details of created VMs"
  value = {
    for vm_key, vm in proxmox_vm_qemu.cloudinit-test : vm_key => {
      name     = vm.name
      ip       = vm.ipconfig0
      cores    = vm.cores
      memory   = vm.memory
      vmid     = vm.vmid
      tags     = vm.tags
    }
  }
}
