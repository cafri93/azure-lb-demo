resource "azurerm_lb_probe" "user14-lb-probe" {
    resource_group_name = azurerm_resource_group.user14-rg.name
    loadbalancer_id = azurerm_lb.user14-lb.id
    name = "http-probe"
    protocol = "Http"
    request_path = "/"
    port = 80
}
