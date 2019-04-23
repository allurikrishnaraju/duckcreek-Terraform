resource "azurerm_public_ip" "Rajulbpublicip" {
    name                         = "${var.public_ip_lb}"
    location                     = "${var.location}"
    resource_group_name          = "${azurerm_resource_group.terrarg.name}"
    allocation_method            = "dynamic"
}