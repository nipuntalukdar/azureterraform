variable "subscription_id"  {
    description = "Azure subscription id"
    type = "string"

}

variable "client_id"  {
    description = "Azure client id"
    type = "string"
}

variable "client_secret"  {
    description = "Azure client secret"
    type = "string"
}

variable "tenant_id"  {
    description = "Name of elasticsearch cluster"
    type = "string"
}

variable "ssh_pub_key"  {
    description = "SSH public key file"
    type = "string"
}
