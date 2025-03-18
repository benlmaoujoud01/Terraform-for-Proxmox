terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.pm_api_url
  pm_tls_insecure = var.pm_tls_insecure
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
}

resource "proxmox_vm_qemu" "cloudinit-test" {
  for_each    = var.virtual_machines
  
  name        = each.value.name
  desc = "VM Created by ${var.author} ${formatdate("DD/MM/YYYY", timestamp())} ip: ${each.value.ipconfig} | Project: ${var.project}"
  vmid        = each.value.vmid
  tags        = each.value.tags
  target_node = each.value.target_node
  clone       = var.template_name
  agent       = 1
  os_type     = "cloud-init"
  
  # CPU Configuration
  cores       = each.value.cores
  sockets     = each.value.sockets
  vcpus       = 0
  cpu         = "host"
  memory      = each.value.memory
  
  scsihw      = "virtio-scsi-pci"
  cicustom    = "vendor=local:snippets/qemu-guest-agent.yml"
  
  disks {
    ide {
      ide2 {
        cloudinit {
          storage = var.storage_pool
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size            = each.value.disk1_size
          cache           = "writeback"
          storage         = var.storage_pool
          replicate       = true

        }
      }
    }
  }

  network {
    model   = "virtio"
    bridge  = var.network_bridge
  }

  boot         = "order=scsi0"
  ipconfig0    = "ip=${each.value.ipconfig}/24,gw=${var.gateway}"
  nameserver   = var.nameservers
  searchdomain = var.searchdomain

  serial {
    id   = 0
    type = "socket"
  }

  ciuser     = var.ciuser
  cipassword = var.cipassword
  sshkeys    = var.ssh_public_key
}
