terraform {
   required_providers {
     azurerm = {
       source = "hashicorp/azurerm"
       version = ">= 2.43"
     }
   }
 }
 provider "azurerm" {
   features {}
 }

resource "azurerm_resource_group" "example" {
  name     = "resourceGroup1"
  location = "West US"
}

resource "azurerm_public_ip" "example" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

output "ip" {
  value = "${azurerm_public_ip.example.ip_address}"
}
