data "azurerm_image" "image" {
  name                = "${var.image_name}"
  resource_group_name = "${var.resource_group}"
}

data "azurerm_public_ip" "getip" {
  count = "${var.machine_count}" 
  name                = "${var.public_ip_name}_${count.index}"
  resource_group_name = "${data.azurerm_resource_group.myterraformgroup.name}"
  depends_on = ["azurerm_virtual_machine.myterraformvm"]
}

data "azurerm_network_interface" "vmnic" {
  count = "${var.machine_count}"
  name                = "${var.nicname}_${count.index}"
  resource_group_name = "${data.azurerm_resource_group.myterraformgroup.name}"
  depends_on = ["azurerm_virtual_machine.myterraformvm"]
}
