variable "vm_count" {
  description = "Specific numerical count for the VMs"
}
variable "ssh_key" {
  description = "The public key to use for the cluster"
}
variable "node" {
  description = "First Proxmox Node"
}
variable "api_url" {
  # url is the hostname (FQDN if you have one) for the proxmox host you'd like to connect to to issue the commands. my proxmox host is 'prox-1u'. Add /api2/json at the end for the API
  description = "url for proxmox cluster"
}
variable "token_id" {
  # api token id is in the form of: <username>@pam!<tokenId>
  description = "Token ID for the cluster"
}
variable "token_secret" {
  # this is the full secret wrapped in quotes. 
  description = "Token secret for the proxmox cluster" 
}
variable "template_name" {
  description = "Template for the container to clone"
}
variable "vm_user" {
  description = "The username for the current template"
}
variable "ip_address" {
  description = "IPv4 Address for the VMs"
}
variable "gateway" {
  description = "Set the gateway for the interface"
}
variable "bridge" {
  description = "Linux Bridge for the VM"
}