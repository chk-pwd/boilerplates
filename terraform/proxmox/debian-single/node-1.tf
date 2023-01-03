# resource is formatted to be "[type]" "[entity_name]" so in this case
# we are looking to create a proxmox_vm_qemu entity named test_server
resource "proxmox_vm_qemu" "debian-x11-bullseye" {

  count = var.master_count # just want 1 for now, set to 0 and apply to destroy VM
  name = "debian-x11-bullseye-${count.index + 1}" #count.index starts at 0, so + 1 means this VM will be named test-vm-1 in proxmox
  
  # Specify VMID for the cluster
  # Comment this to obtain the next available ID
  #vmid = "50${count.index + 1}"

  # Proxmox target node
  target_node = var.node1

  # Clone machine info
  clone = var.template_name

  # VMs settings
  agent = 1
  os_type = "cloud-init"
  cores = 1
  sockets = 1
  cpu = "host"
  memory = 1024
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "48G"
    type = "scsi"
    storage = "Arenas"
    iothread = 1
  }
  
  # Configure multiple NICs
  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  
  # Cloud init options
  #cicustom = "user=local:snippets/cloud_init_deb10_vm-01.yml"
  #ipconfig0 = "ip=172.16.16.3${count.index + 1}/24,gw=172.16.16.1"
  ipconfig0 = "ip=172.16.16.65/24,gw=172.16.16.1"
 
  # SSH Keys settings
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
