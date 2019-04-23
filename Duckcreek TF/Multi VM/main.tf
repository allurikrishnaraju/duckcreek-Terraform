provider "azurerm" {
  subscription_id = "7df8f709-d090-4cd6-bc5b-5c2b6c6e6067"
  client_id       = "481f9bec-430a-4a02-a1e8-5b1b851eed3f"
  client_secret   = "584f3170-0efb-476f-a6e5-f5dd05c8895d"
  tenant_id       = "eafcb819-ddb0-46e2-a176-0e29d8fbaead"
}

data "azurerm_resource_group" "resourcegroup" {
  name = "duckrg"
}
