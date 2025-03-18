# Terraform Proxmox VM Deployment

## Overview
This repository contains Terraform code to automate the provisioning of VMs in a Proxmox environment.

## Prerequisites
Before using this Terraform configuration, ensure you have the following:

- A running Proxmox instance with API access enabled.
- Terraform installed on your local machine ([Download Terraform](https://www.terraform.io/downloads)).
- API Token and proper access credentials in Proxmox.
- A configured cloud-init template if using cloud-init.


## Configuration
### Step 1: Configure `terraform.tfvars`
Edit the `terraform.tfvars` file to match your Proxmox setup. Ensure you define:

- `proxmox_api_url`: Your Proxmox API endpoint.
- `proxmox_api_token`: API token for authentication.
- `node`: Name of the Proxmox node where the VM will be deployed.
- `vm_name`: The name of the VM.
- `vm_cpu`: Number of CPUs.
- `vm_memory`: RAM size in MB.
- `vm_disk_size`: Disk size in GB.
- `vm_network`: Network configuration.

Example:
```hcl
proxmox_api_url = "https://your-proxmox-url:8006/api2/json"
proxmox_api_token = "your-token"
node = "proxmox-node"
vm_name = "my-vm"
vm_cpu = 2
vm_memory = 4096
vm_disk_size = 20
vm_network = "vmbr0"
```

## Usage
### Step 1: Initialize Terraform
Run the following command to initialize the Terraform working directory:
```sh
terraform init
```

### Step 2: Plan the Deployment
To preview the actions Terraform will take, run:
```sh
terraform plan
```

### Step 3: Apply the Configuration
Deploy the VM using:
```sh
terraform apply -auto-approve
```

### Step 4: Destroy the VM (if needed)
To remove the deployed VM, run:
```sh
terraform destroy -auto-approve
```

## Notes
- Ensure that your Proxmox server allows API access.
- Be cautious with `terraform destroy`, as it will permanently remove the VM.
- Modify `main.tf` as needed to customize VM creation settings.

## License
This project is licensed under the MIT License. Feel free to modify and use as needed.

## Contact
For any issues or questions, feel free to open an issue or reach out.

