variable "resource_group" {
  description = "Resoure group for your deployment"
  default = "Nipun1"
}

variable "setuptags" {
    description = "Tag to be assigned to the servers"
    type = "map"
    default = {
        nipun = "firstsetup"
        purpose = "demo1"
    }
}

variable "machine_count" {
    description = "Number of vms"
    default = "3" 
}

variable "disk_prefix" {
    description = "Disk name prfix"
    default = "storagedisk" 
}

variable "virtual_network_name" {
    description = "Virtual network name"
    default = "myvnet" 
}

variable "virtual_network_address_space" {
    description = "Virtual network address space"
    default = ["10.0.0.0/16"]
}

variable "location" {
    description = "Location"
    default = "eastus"
}   

variable "address_prefix"  {
    description = "Address prefix"
    default = "10.0.2.0/24"
}

variable "public_ip_name"  {
    description = "Public ip name"
    default = "mypublicip"
}

variable "networksecgroup"  {
    description = "Network security group name"
    default = "mynwsecgrp"
}

variable "nicname"  {
    description = "Name for NIC"
    default = "mynic"
}

variable "vm_name"  {
    description = "Name for VM"
    default = "vm"
}

variable "vm_size"  {
    description = "Size for VM"
    default = "Standard_DS1_v2"
}

variable "image_name"  {
    description = "Image the VM will be created from"
    default = "elasticsearch_image"
}

variable "ssh_public_key_path" {
    description  = "SSH public key file path"
    type = "string"
}

variable "ssh_pvt_key_path" {
    description = "SSH private key"
    default = "/home/nipun/.ssh/id_rsa"
}

variable "escluster_name"  {
    description = "Name of elasticsearch cluster"
    default = "escluster"

}


variable "azure_subscription_id"  {
    description = "Azure subscription id"
    type = "string"

}

variable "azure_client_id"  {
    description = "Azure client id"
    type = "string"
}

variable "azure_client_secret"  {
    description = "Azure client secret"
    type = "string"
}

variable "azure_tenant_id"  {
    description = "Name of elasticsearch cluster"
    type = "string"
}

