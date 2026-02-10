resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}



resource "azurerm_virtual_network" "vnet_01" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = local.address_space

  tags = {
    environment = "Production"
  }
}


resource "azurerm_subnet" "subnet01" {
  for_each             = local.subnets
  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.vnet_01.name
  address_prefixes     = [each.value.address_prefix]

}
