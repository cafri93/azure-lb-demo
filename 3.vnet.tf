resource "azurerm_virtual_network" "user14-net" {
    name = "user14-vnet"
    address_space = ["14.0.0.0/16"]
    location = azurerm_resource_group.user14-rg.location
    resource_group_name = azurerm_resource_group.user14-rg.name
}
