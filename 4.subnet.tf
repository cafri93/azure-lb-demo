resource "azurerm_subnet" "user14-subnet1" {
    name = "user14-mysubnet1"
    resource_group_name = azurerm_resource_group.user14-rg.name
    virtual_network_name = azurerm_virtual_network.user14-net.name
    address_prefixes = ["14.0.1.0/24"]
}
