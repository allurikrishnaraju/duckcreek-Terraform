
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

variable "vnet_prefix" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "A list of public subnets inside the vNet."
  default     = "ducksubnet"
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.1.0/24"
}

variable "storage_account_name" {
  description = "Defines the type of storage account to be created. Valid options are Standard_LRS, Standard_ZRS, Standard_GRS, Standard_RAGRS, Premium_LRS."
  default     = "duck"
}

variable "account_tier_type" {
  description = "Defines the type of storage account to be created. Valid options are Standard and Premium."
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Defines the type of storage account to be created. Valid options are LRS, ZRS, GRS, RAGRS"
  default     = "LRS"
}

variable "security_group_name" {
  description = "Network security group name"
  default     = "ducknsg"
}

variable "public_ip" {
  description = "Public IP Name"
  default     = "duckpublicip"
}

variable "virtual_machine" {
  description = "Azure Virtual Machine Name"
  default     = "duckvm"
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
