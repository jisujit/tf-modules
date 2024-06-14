/*
 * File Name: variables.tf --sql-server module
 * Author: Sujit Gangadharan (gsujit@gmail.com)
 * Date Created: 2024-04-22
 * Last Modified: 2024-04-22
 * Description:
 *   variable definition for TF SQl-Server module that will be used by applications
 */

variable "db_name" {
  type        = string
  description = "Name of the SQL Server instance"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region for the SQL Server"
}
