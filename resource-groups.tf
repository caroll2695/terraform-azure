provider "azurerm" {
}
resource "azurerm_resource_group" "rg" {
        name = "TF-AMOS-RG"
        location = "${var.location}"

        tags = {
        environment = "Terraform Demo"
        
        }
}
