resource "azurerm_storage_account" "mystorageaccount" {
    name                = "diag${random_id.randomId.hex}"
    resource_group_name = "${data.azurerm_resource_group.myterraformgroup.name}"
    location            = "${var.location}"
    account_replication_type = "LRS"
    account_tier = "Standard"
    tags = "${var.setuptags}"
}
