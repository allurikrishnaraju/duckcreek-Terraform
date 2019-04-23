resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group_name = "${azurerm_resource_group.terrarg.name}"
    }
    byte_length = 8
}
resource "azurerm_storage_account" "mystorageaccount" {
    name                        = "raju${random_id.randomId.hex}"
    resource_group_name         = "${azurerm_resource_group.terrarg.name}"
    location                    = "${var.location}"
    account_tier                = "Standard"
    account_replication_type    = "LRS"
}
