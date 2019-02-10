resource "azurerm_virtual_machine" "myterraformvm" {
    count                 = "${var.machine_count}"
    name                  = "${var.vm_name}_${count.index}"
    location              = "${var.location}"
    resource_group_name   = "${data.azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${element(azurerm_network_interface.myterraformnic.*.id, count.index)}"]
    vm_size               = "${var.vm_size}"
    delete_os_disk_on_termination = true
    delete_data_disks_on_termination = true
    
    storage_image_reference {
       id="${data.azurerm_image.image.id}"
    }

    storage_os_disk {
        name = "${var.disk_prefix}${count.index}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    os_profile {
        computer_name  = "myvm${count.index}"
        admin_username = "ubuntu"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/ubuntu/.ssh/authorized_keys"
            key_data = "${file("${var.ssh_public_key_path}")}"
        }
    }

    boot_diagnostics {
        enabled     = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    provisioner "file" {
      source      = "${path.module}/configandscripts"
      destination = "/home/ubuntu/"

      connection {
          type     = "ssh"
          user     = "ubuntu"
          private_key = "${file("${var.ssh_pvt_key_path}")}"
      }
    }
    tags = "${var.setuptags}"
}

resource "null_resource" "confprepare" {
  count = "${var.machine_count}"
  depends_on = ["azurerm_virtual_machine.myterraformvm"]
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("${var.ssh_pvt_key_path}")}"
    host = "${element(data.azurerm_public_ip.getip.*.ip_address, count.index)}"
  }

  provisioner "remote-exec" {
    inline = [
      <<EOT
      sudo bash /home/ubuntu/configandscripts/prepareesconf.sh \
         "${element(data.azurerm_network_interface.vmnic.*.private_ip_address, count.index)}" \
         "${join(",", data.azurerm_network_interface.vmnic.*.private_ip_address)}" \
         "${var.escluster_name}"
      EOT
      ,
      "sudo systemctl enable elasticsearch"
    ]
  }
}


resource "null_resource" "startes" {
  count = "${var.machine_count}"
  depends_on = ["null_resource.confprepare"]
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("${var.ssh_pvt_key_path}")}"
    host = "${element(data.azurerm_public_ip.getip.*.ip_address, count.index)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl start elasticsearch"
    ]
  }
}
