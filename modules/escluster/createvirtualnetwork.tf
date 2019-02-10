resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "${var.virtual_network_name}"
    address_space       = "${var.virtual_network_address_space}" 
    location            = "${var.location}"
    resource_group_name = "${data.azurerm_resource_group.myterraformgroup.name}"
    tags = "${var.setuptags}"
}
