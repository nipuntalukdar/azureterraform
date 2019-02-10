resource "azurerm_public_ip" "myterraformpublicip" {
    count = "${var.machine_count}"
    name                         = "${var.public_ip_name}_${count.index}"
    location                     = "${var.location}"
    resource_group_name          = "${data.azurerm_resource_group.myterraformgroup.name}"
    allocation_method = "Dynamic"
    tags = "${var.setuptags}"
}
