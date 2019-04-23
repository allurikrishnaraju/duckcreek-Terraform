resource "azurerm_availability_set" "avset" {
 name                         = "${var.availability_set_name}"
 location                     = "${var.location}"
 resource_group_name          = "${azurerm_resource_group.terrarg.name}"
 platform_fault_domain_count  = 2
 platform_update_domain_count = 5
 managed                      = true
}
