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

  public_network_access_enabled = false
  allow_nested_items_to_be_public = false

  blob_properties {
    delete_retention_policy {
      days = 14
    }
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true
    blob_prefix_match = "logs/"
    days = 30
    enabled = true
    tier = "Archive"
  }

  storage_service_properties {
    default_service_version = "2021-08-06"
    hour_metrics {
      enabled = true
    }
    minute_metrics {
      enabled = true
    }
    logging {
      read = true
      write = true
      delete = true
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_rules {
    default_action = "Deny"
    ip_rules = []
    virtual_network_subnet_ids = []
  }

  sas_policy {
    default_account_sas_ttl = "PT1H"
  }

  encryption {
    key_source = "Microsoft.KeyVault"
    key_type = "Account"
    key_vault_properties {
      key_name = "key-name"
      key_vault_id = "/subscriptions/subscription-id/resourceGroups/resource-group-name/providers/Microsoft.KeyVault/vaults/vault-name"
    }
  }
}