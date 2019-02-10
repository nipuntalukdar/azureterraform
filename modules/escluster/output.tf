output "public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = ["${data.azurerm_public_ip.getip.*.ip_address}"]
}

output "vm_private_ip" {
  description = "private ip addresses of the vm nics"
  value       = ["${data.azurerm_network_interface.vmnic.*.private_ip_address}"]
}

