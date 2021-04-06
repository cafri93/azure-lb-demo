resource "azurerm_virtual_machine" "web2" {
    name                  = "user14web2"
    location              = azurerm_resource_group.user14-rg.location
    resource_group_name   = azurerm_resource_group.user14-rg.name
    availability_set_id   = azurerm_availability_set.avset.id
    network_interface_ids = [azurerm_network_interface.nic2.id]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "myOsDisk2"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }
    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

 os_profile {
        computer_name  = "user14web2"
        admin_username = "azureuser"
        admin_password = "zkvmfl1993!!"
	custom_data= file("web.sh")
    }

 os_profile_linux_config {
        disable_password_authentication = false
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDE0wMTOsbyfIdp4PwE1eVAD6THN/Xs4D7vFro19Brc6m6Ae0P1Z5Aa/09QaIgq7c921hdwtpPQ1FnNva56CO76T47EC3RV+cg1OIowe7w44V4pDxHsXRRVTh1rfWCc5iZgqepESpQ/UCJ3Aa/pWX19cF6jeYjNJcSk83jgRNk5Fvt7kHJmzaSFdZ/kDeHBlcxYcXBOM7AmypEJZy/emQFeAGewSLDJyqp2CTlYvGQpuCCFgJRmMGsKFAqlxa5EkTTggUFMyyVc3Vz5Sqxx2O1MoKUUshYcgcGw/dKsihQ2mdHB9u7eum6/X6yNI5KuqOzpgXkVmSLiczkHMuB/kkVx user14@user14admin"
        }
    }
    boot_diagnostics {
        enabled     = "true"
        storage_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
    }

    tags = {
        environment = "Terraform Demo"
    }
}

