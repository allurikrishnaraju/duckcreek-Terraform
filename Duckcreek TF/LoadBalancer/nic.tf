resource "azurerm_network_interface" "terranic" {
    count                     = "${var.total_count}" 
    name                      = "${var.network_interface}${count.index}"
    location                  = "${var.location}"
    resource_group_name       = "${azurerm_resource_group.terrarg.name}"
    network_security_group_id = "${azurerm_network_security_group.terransg.id}"

    ip_configuration {
        name                          = "${var.ip_conf_name}"
        subnet_id                     = "${azurerm_subnet.terrasubnet.id}"
        private_ip_address_allocation = "dynamic"
        load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.backendaddrpool.id}"]
    }
}
