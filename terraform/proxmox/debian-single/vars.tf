variable "ssh_key" {
  description = "The public key to use for the cluster"
}
variable "node1" {
  description = "First Proxmox Node"
}
variable "node2" {
  description = "Second Proxmox Node"
}
variable "node3" {
  description = "Third Proxmox Node"
}
variable "master_count" {
  description = "Count for master nodes"
}
variable "worker_count" {
  description = "Count for worker nodes" 
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