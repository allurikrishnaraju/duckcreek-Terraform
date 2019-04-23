
variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default     = "RajuRG"
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  default     = "westus"
}
variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = "RajuVNet"
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  default     = "Rajusubnet"
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.1.0/24"
}

variable "security_group_name" {
  description = "Network security group name"
  default     = "Rajunsg"
}

variable "public_ip_lb" {
  description = "Public IP Name"
  default     = "Rajulbpublicip"
}

variable "network_interface" {
  description = "NIC Name"
  default     = "Rajunic"
}

variable "ip_conf_name" {
  description = "NIC Name"
  default     = "rajunicipconfig"
}

variable "virtual_machine" {
  description = "Azure Virtual Machine Name"
  default     = "Rajuvm"
}

variable "availability_set_name" {
  description = "Availability Set Name"
  default     = "RajuASet"
}

variable "total_count" {
  description = "No of loops"
  default     = 2
}

variable "laod_balancer_name" {
  description = "LoadBalancer Name"
  default     = "Rajulb"
}

variable "backend_addr_pool" {
  description = "Backend Address pool Name"
  default     = "Rajulbbackendpool"
}

variable "lb_health_probe" {
  description = "LoadBalancer Health Probe Name"
  default     = "Rajulbprobe"
}