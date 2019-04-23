resource "azurerm_lb" "rajulb" {
 name                = "${var.laod_balancer_name}"
 location            = "${var.location}"
 resource_group_name = "${azurerm_resource_group.terrarg.name}"

 frontend_ip_configuration {
   name                 = "${var.public_ip_lb}"
   public_ip_address_id = "${azurerm_public_ip.Rajulbpublicip.id}"
 }
}

resource "azurerm_lb_backend_address_pool" "backendaddrpool" {
 resource_group_name = "${azurerm_resource_group.terrarg.name}"
 loadbalancer_id     = "${azurerm_lb.rajulb.id}"
 name                = "${var.backend_addr_pool}"
}

resource "azurerm_network_interface_backend_address_pool_association" "backpoolasso" {
  network_interface_id    = "${element(azurerm_network_interface.terranic.*.id, count.index)}"
  ip_configuration_name   = "${var.ip_conf_name}"
  backend_address_pool_id = "${azurerm_lb_backend_address_pool.backendaddrpool.id}"
}

resource "azurerm_lb_probe" "lbprobe" {
  resource_group_name = "${azurerm_resource_group.terrarg.name}"
  loadbalancer_id     = "${azurerm_lb.rajulb.id}"
  name                = "${var.lb_health_probe}"
  port                = 80
}

resource "azurerm_lb_rule" "lbrule" {
  resource_group_name            = "${azurerm_resource_group.terrarg.name}"
  loadbalancer_id                = "${azurerm_lb.rajulb.id}"
  backend_address_pool_id        = "${azurerm_lb_backend_address_pool.backendaddrpool.id}"
  probe_id            = "${azurerm_lb_probe.lbprobe.id}"
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "${var.public_ip_lb}"
}