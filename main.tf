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
  enable_https_traffic_only = true
  min_tls_version = "TLS1_2"
  soft_delete_enabled = true
  delete_retention_policy = 7
  enable_blob_public_access = false
  enable_file_public_access = false
  enable_static_website = false
  is_hns_enabled = true
  account_kind = "StorageV2"
  sku_name = "Standard_LRS"
  access_tier = "Hot"
  blob_properties {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  queue_properties {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  static_website {
    index_document = "index.html"
  }
  network_rules {
    default_action = "Deny"
    ip_rules = []
    virtual_network_subnet_ids = []
  }
  identity {
    type = "SystemAssigned"
  }
  resource_id = azurerm_storage_account.storage.id
  storage_data_lake_gen2_account {
    enable_data_encryption = true
    key_source = "Microsoft.Keyvault"
    key_vault_id = azurerm_key_vault.keyvault.id
  }
  storage_data_lake_gen2_account_encryption {
    enable_data_encryption = true
    key_source = "Microsoft.Keyvault"
    key_vault_id = azurerm_key_vault.keyvault.id
  }
  storage_encryption {
    key_source = "Microsoft.Keyvault"
    key_vault_id = azurerm_key_vault.keyvault.id
  }
  storage_msi {
    identity {
      type = "SystemAssigned"
    }
  }
  storage_queue {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_share {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_table {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_container {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_container_sas_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_sas_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_service {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_container_access_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_access_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_container_sas_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_sas_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_service {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_container_access_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_access_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_container_sas_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_sas_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_service {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_container_access_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_access_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_container_sas_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_sas_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_service {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_container_access_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_access_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_container_sas_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_sas_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_service {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_container_access_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_access_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_container_sas_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false
    is_hns_enabled = true
  }
  storage_blob_sas_policy {
    delete_retention_policy = 7
    enable_blob_public_access = false
    enable_file_public_access = false
    enable_static_website = false