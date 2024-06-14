/*
 * File Name: main.tf --linux-vm module
 * Author: Sujit Gangadharan (gsujit@gmail.com)
 * Date Created: 2024-04-19
 * Last Modified: 2024-04-21
 * Description:
 *   create a TF linux-vm module that will be used by applications
 */
terraform {
  required_version = ">= 1.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100.0"
    }
  }
}
resource "azurerm_linux_virtual_machine" "vm" {
  depends_on = [  resource.azurerm_network_interface.nic]
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size  // Adjust as needed
  admin_username      = var.admin_username
  network_interface_ids = [resource.azurerm_network_interface.nic.id]

os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

//how do you store this securely?
admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }
}

# Define NIC resource if not defined elsewhere - where do you define NIC and IP address
resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}