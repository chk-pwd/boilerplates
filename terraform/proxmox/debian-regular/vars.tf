variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDSEA915XsZGIUolTTS5ZrAYBpafMnDSex/25wp5zonoF5HkgvssUzgAj3lze6jJQS+SrGDwnWfAvFFQV+1llM7P8eKxQIty9JNZY/iqELFhc7dYJT3rLIyGevTF9rdNKQGilSpDUSOBeEAyh9ydBdJc50kMLT2uM3dh4zWDn6VPq5r1Mjh0Z7O4kOP/3Y9sswWor9y2vG013aTHJU29odVLc5pZyf7pYVUw9mUOe2lz+0ZCWdycCVb2nx2zwa3O+lo60zswIHr+sPsZKKTjme63eXCfCzMldYn/kQWJZJzex6qqjsONunxrPkiPR36VbP8XpAYg1eob+Yrvi4whlV86bnjP7L+xZhKatpkIxQA1XiIv1yXZVPpHEjz7ZwWXxNaGpgmDvC8uLwThWksFxco/VDstT38B3xpZGTq6EKiI1vRJZQGsu57Bp43Smi8Zvbv36fT43rEyP1/8Wi9rv27D8fF+SqspSCQXZhrtZ96dubwTlzEdgrjt1iY5jKSigc= hyoga@uplink"
}
variable "proxmox_host" {
    default = "caustic"
}
variable "template_name" {
    default = "debian11-golden"
}
variable "vm_name" {
    default = "ash"
}
#variable "pods_cidr" {

#}
#variable "master_cidr" {

#}