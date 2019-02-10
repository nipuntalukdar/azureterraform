resource "azurerm_network_security_group" "myterraformnsg" {
    name                = "${var.networksecgroup}"
    location            = "${var.location}"
    resource_group_name = "${data.azurerm_resource_group.myterraformgroup.name}"

    security_rule {
        name                       = "SSHHTTPS"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges     = ["22", "443"]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "ALLOUTBOUND"
        priority                   = 1001
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "INTERNALTRAFFICOUT"
        priority                   = 1002
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "${var.address_prefix}"
        destination_address_prefix = "${var.address_prefix}" 
    }

    security_rule {
        name                       = "INTERNALTRAFFICIN"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "${var.address_prefix}"
        destination_address_prefix = "${var.address_prefix}" 
    }
    tags = "${var.setuptags}"
}
