resource "azurerm_resource_group" "rg" {
  name     = "rg-zerotouch-sec-dev"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage" {
  name                     = "stzerotouchsecdev001"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  public_network_access_enabled = true
  allow_nested_items_to_be_public = true
}