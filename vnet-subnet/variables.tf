/*Define the variables used in .tf file */
/* Ref: https://github.com/Azure/terraform-azurerm-vnet/blob/main/variables.tf*/
/* Review */
/* Date created: 04-01-2024 */

variable "resource_group_name" {
  description = "Name of resource_group under which this vnet will be managed"
  type        = string
}

variable "vnet_name" {
  description = "Name of the VNet"
  type        = string
}

variable "address_space" {
  description = "IP CIDR range that consumers can use for their VNET" //If this vnet is fixed value, should default define it
  type        = list(string)
  //default     = ["10.0.0.0/16"]
}

variable "vnet_location" {
  type        = string
  description = "The (Azure) region in which to create the vnet."
  nullable    = false
}

variable "subnets"{
  type = map(object({
      address_prefixes = list(string)
  }))
  description = "A map of subnet objects"
}
