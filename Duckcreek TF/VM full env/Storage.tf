resource "random_id" "randomId" {
    keepers = {
        # Generate a new unique ID only when a new resource group is defined
        resource_group_name = "${azurerm_resource_group.terrarg.name}"
    }
    byte_length = 8
}
resource "azurerm_storage_account" "mystorageaccount" {
    name                        = "${var.storage_account_name}${random_id.randomId.hex}"
    resource_group_name         = "${azurerm_resource_group.terrarg.name}"
    location                    = "${azurerm_resource_group.terrarg.location}"
    account_tier                = "${var.account_tier_type}"
    account_replication_type    = "${var.account_replication_type}"
}
