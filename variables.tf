
variable "author" {
  description = "Author of the infrastructure"
  type        = string
  default     = "Benlmaoujoud Mohamed"
}
variable "project" {
  description = "Project name"
  type = string
  default = "Proxmox project "
  
}

variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
  default     = "https://x,x,x,x,:8006/api2/json"
}

variable "pm_tls_insecure" {
  description = "Skip TLS verification"
  type        = bool
  default     = true
}

variable "pm_api_token_id" {
  description = "Proxmox API token ID"
  type        = string
  sensitive   = true
}

variable "pm_api_token_secret" {
  description = "Proxmox API token secret"
  type        = string
  sensitive   = true
}

variable "template_name" {
  description = "Name of the template to clone"
  type        = string
  default     = "Ubuntu22-Template"
}

variable "storage_pool" {
  description = "Storage pool for VM disks"
  type        = string
  default     = "yourStorage"
}

variable "network_bridge" {
  description = "Network bridge for VM network interface"
  type        = string
  default     = "yourBridge"
}

variable "gateway" {
  description = "Network gateway"
  type        = string
  default     = ""
}

variable "nameservers" {
  description = ""
  type        = string
  default     = ""
}

variable "searchdomain" {
  description = "Search domain"
  type        = string
  default     = "8.8.8.8"
}

variable "ciuser" {
  description = "Cloud-init user"
  type        = string
  default     = "application"
}

variable "cipassword" {
  description = "Cloud-init password"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "SSH public key for VM access"
  type        = string
  default     = ""
}

variable "virtual_machines" {
  description = "Map of virtual machines to create"
  type = map(object({
    name        = string
    vmid        = number
    ipconfig    = string
    tags        = string
    target_node = string
    cores       = number
    sockets     = number
    memory      = number
    disk1_size  = number
  }))
}
