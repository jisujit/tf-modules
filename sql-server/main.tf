/*
 * File Name: main.tf --sql-server module
 * Author: Sujit Gangadharan (gsujit@gmail.com)
 * Date Created: 2024-04-22
 * Last Modified: 2024-04-22
 * Description:
 *   create a TF SQl-Server module that will be used by applications
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
resource "azurerm_sql_server" "sql" {
  name                         = var.db_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"   // SQL Server version
  administrator_login          = "sqladmin"
  administrator_login_password = "ComplexPassword#1234"
//need to understand what is this used for,
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_sql_database" "db" {
  name                = "${var.db_name}-db"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sql.name
  max_size_gb         = 2
  location            = var.location
}
