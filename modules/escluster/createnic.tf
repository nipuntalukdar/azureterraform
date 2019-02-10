resource "azurerm_network_interface" "myterraformnic" {
    count = "${var.machine_count}"
    name                = "${var.nicname}_${count.index}"
    location            = "${var.location}"
    resource_group_name = "${data.azurerm_resource_group.myterraformgroup.name}"
    network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = "${azurerm_subnet.myterraformsubnet.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${element(azurerm_public_ip.myterraformpublicip.*.id, count.index)}"
    }

    tags = "${var.setuptags}"
}
