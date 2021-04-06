resource "azurerm_resource_group" "user14-rg" {
    name     = "user14rg"
    location = "koreacentral"

    tags = {
        environment = "Terraform Demo"
    }
}
