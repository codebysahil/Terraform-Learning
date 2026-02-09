resource "azurerm_windows_virtual_machine" "webvm01" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = var.vm_size
  admin_username      = var.user_name
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.example.id,
    azurerm_network_interface.nic2.id
  ]
 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_managed_disk" "vm_data_disk" {
  name                 = "datadisk01"
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 1

  tags = {
    environment = "staging"
  }
}
resource "azurerm_virtual_machine_data_disk_attachment" "datadisk01_webvm01" {
  managed_disk_id    = azurerm_managed_disk.vm_data_disk.id
  virtual_machine_id = azurerm_windows_virtual_machine.webvm01.id
  lun                = 0
  caching            = "ReadWrite"
}
