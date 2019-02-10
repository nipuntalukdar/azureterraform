resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "${var.virtual_network_name}"
    resource_group_name  = "${data.azurerm_resource_group.myterraformgroup.name}"
    virtual_network_name = "${azurerm_virtual_network.myterraformnetwork.name}"
    address_prefix       = "${var.address_prefix}"
}
