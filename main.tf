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
  subscription_id = "2134d62e-5ae7-49a1-9bd5-c793f3b0a74c"
  client_id       = "eeea62ec-cc64-4e2a-867e-76554e57a839"
  client_secret   = "xmv8Q~X-AhW5ilIE.y9Xt9aWGqmkiM1ogDzClaLK"
  tenant_id       = "33bc5ab6-4632-439e-8d43-201b74aaa8b3"

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
