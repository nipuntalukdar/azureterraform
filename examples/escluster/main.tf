module createescluster {
    source = "github.com/nipuntalukdar/azureterraform/modules/escluster"
    azure_tenant_id = "${var.tenant_id}"
    azure_subscription_id = "${var.subscription_id}"
    azure_client_id = "${var.client_id}"
    azure_client_secret = "${var.client_secret}"
    ssh_public_key_path = "${var.ssh_pub_key}"
}
