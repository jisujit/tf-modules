/*
 * File Name: main.tf
 * Author: Sujit Gangadharan (gsujit@gmail.com)
 * Date Created: 2024-04-01
 * Last Modified: 2024-04-01
 * Description:
 *   create a TF Vnet module that accepts CIDRs from consumer
 */

//Ref: https://registry.terraform.io/modules/Azure/vnet/azurerm/latest?tab=inputs
//Azure Vnet module: https://github.com/Azure/terraform-azurerm-vnet/blob/main/main.tf
terraform {
  required_version = ">= 1.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100.0"
    }
  }
}
resource "azurerm_virtual_network" "vnet" {
  resource_group_name = var.resource_group_name
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.vnet_location
}


resource "azurerm_subnet" "snet" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.address_prefixes
}
