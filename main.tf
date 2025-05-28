resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  name     = random_pet.rg_name.id
  location = var.resource_group_location
}

resource "random_string" "azurerm_search_service_name" {
  length  = 25
  upper   = false
  numeric = false
  special = false
}

resource "random_string" "storage_account_suffix" {
  length  = 8
  upper   = false
  numeric = true
  special = false
}

resource "azurerm_search_service" "search" {
  name                = "dhaibotsearch"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.sku
  replica_count       = var.replica_count
  partition_count     = var.partition_count
}

resource "azurerm_storage_account" "storage" {
  name                     = "dhaibotstorage${random_string.storage_account_suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "search_service_name" {
  value = azurerm_search_service.search.name
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}
