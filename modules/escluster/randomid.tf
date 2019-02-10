resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = "${data.azurerm_resource_group.myterraformgroup.name}"
    }

    byte_length = 8
}
