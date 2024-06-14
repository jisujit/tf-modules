/*
 * File Name: variables.tf --linux-vm module
 * Author: Sujit Gangadharan (gsujit@gmail.com)
 * Date Created: 2024-04-19
 * Last Modified: 2024-04-21
 * Description:
 *   defining variables used in main.tf of the linux-vm module
 */
variable "vm_name" {
  type        = string
  description = "Name of the VM"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region for the VM"
}
variable "vm_size" {
  type        = string
  description = "Size of the VM"
}

variable "network_interface_id" {
  type        = string
  description = "Network Interface ID to attach to the VM"
}

variable "admin_username"{
    type = string
    description = "Admin username for the VM"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for admin access"
}

variable "subnet_id" {
  type        = string
  description = "Subnet Id for the VM to be associated with"
}