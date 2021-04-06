resource "azurerm_lb" "user14-lb" {
  name = "user14lb"
  location = azurerm_resource_group.user14-rg.location
  resource_group_name = azurerm_resource_group.user14-rg.name
  frontend_ip_configuration {
  name = "user14PublicIPAddress"
  public_ip_address_id = azurerm_public_ip.user14-publicip.id
 }
}
