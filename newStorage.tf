/*

resource "azurerm_resource_group" "devrg" {
  name     = "dev-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "devstorageaccount" {
  name                     = "devstorageaccount88914"
  resource_group_name      = azurerm_resource_group.devrg.name
  location                 = azurerm_resource_group.devrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "devcontainer" {
  name                  = "test"
  storage_account_id    = azurerm_storage_account.devstorageaccount.id
    
}

resource "azurerm_storage_blob" "example" {
  name                   = "myfiles"
  storage_account_name   = azurerm_storage_account.devstorageaccount.name
  storage_container_name = azurerm_storage_container.devcontainer.name
  type                   = "Block"
  source                 = "sample.txt"
}

*/

