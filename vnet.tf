resource "azurerm_resource_group" "example" {
  name     = local.resource_group_name
  location = local.resource_group_location
}

resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = local.resource_group_location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_virtual_network" "example" {
  name                = local.virtual_network.name
  location            = local.resource_group_location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = local.virtual_network.address_prefixes
  
tags = {
    environment = "Production"
  }
}


resource "azurerm_subnet" "websubet01" {
  name                 = local.subnets_data[0].name
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = local.subnets_data[0].address_prefix
}


resource "azurerm_subnet" "appsubnet01" {
  name                 = local.subnets_data[1].name
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = local.subnets_data[1].address_prefix

  
}

resource "azurerm_network_interface" "example" {
  name                = local.webinterface_name
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.websubet01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.webip01.id
  }
}

output "websubnet01_id"{
    value = azurerm_subnet.websubet01.id

}


resource "azurerm_network_interface" "nic2" {
  name                = local.privateinterface_name
  location            = local.resource_group_location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.websubet01.id
    private_ip_address_allocation = "Dynamic"
    
  }
}



resource "azurerm_public_ip" "webip01" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_security_group" "app_nsg" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "AllowRDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet_network_security_group_association" "websubet01_nsg_association" {
  subnet_id                 = azurerm_subnet.websubet01.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "appsubnet01_nsg_association" {
  subnet_id                 = azurerm_subnet.appsubnet01.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}
