resource "azurerm_recovery_services_vault" "myvault" {
  name                = "raju-recovery-vault"
  location            = "${azurerm_resource_group.terrarg.location}"
  resource_group_name = "${azurerm_resource_group.terrarg.name}"
  sku                 = "Standard"
}

resource "azurerm_recovery_services_protection_policy_vm" "vaultpolicy" {
  name                = "duck-recovery-vault-policy"
  resource_group_name = "${azurerm_resource_group.terrarg.name}"
  recovery_vault_name = "${azurerm_recovery_services_vault.myvault.name}"

  backup {
    frequency = "Daily"
    time      = "23:00"
  }
  retention_daily {
    count = 14
  }
}

resource "azurerm_recovery_services_protected_vm" "vmbackup" {
  resource_group_name = "${azurerm_resource_group.terrarg.name}"
  recovery_vault_name = "${azurerm_recovery_services_vault.myvault.name}"
  source_vm_id        = "${azurerm_virtual_machine.terravm.id}"
  backup_policy_id    = "${azurerm_recovery_services_protection_policy_vm.vaultpolicy.id}"
}