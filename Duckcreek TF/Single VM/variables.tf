variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default     = "duckrg"
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  default     = "westus"
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = "duckvnet"
}


variable "subnet_name" {
  description = "A list of public subnets inside the vNet."
  default     = "ducksubnet"
}

variable "public_ip" {
  description = "Public IP Name"
  default     = "singlevmpublicip"
}

variable "virtual_machine" {
  description = "Azure Virtual Machine Name"
  default     = "singlevmtest"
}

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_DS1_V2"
}

variable "admin_username" {
  description = "The admin username of the VM that will be deployed"
  default     = "azureuser"
}

variable "admin_password" {
  description = "The admin password to be used on the VM that will be deployed"
  default     = "Grid41312!"
}
