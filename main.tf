terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}
variable "joy" {
    type = string
}

variable "location" {
    type = string
  
}

variable "vm_name" {
  type = list(string)
}


resource "azurerm_resource_group" "johit" {
    name     = "${var.joy}"
    location = "${var.location}"
    tags = {
        environment = "Terraform Demo"
    }
}
resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "${var.joy}-myvnet"
    address_space       = ["10.0.0.0/16"]
    location            = "${var.location}"
    resource_group_name = azurerm_resource_group.johit.name

    tags = {
        environment = "Terraform Demo"
    }
}

