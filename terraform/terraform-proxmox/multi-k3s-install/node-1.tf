# resource is formatted to be "[type]" "[entity_name]" so in this case
# we are looking to create a proxmox_vm_qemu entity named test_server
resource "proxmox_vm_qemu" "k3s-master-1" {

  count = var.master_count # just want 1 for now, set to 0 and apply to destroy VM
  name = "k3s-master-${count.index + 1}" #count.index starts at 0, so + 1 means this VM will be named test-vm-1 in proxmox
  
  # Specify VMID for the cluster
  vmid = "50${count.index + 1}"

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
    size = "8G"
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
  ipconfig0 = "ip=172.16.16.3${count.index + 1}/24,gw=172.16.16.1"
  
  # SSH Keys settings
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

resource "proxmox_vm_qemu" "k3s-agent-1" {

  count = var.worker_count # just want 1 for now, set to 0 and apply to destroy VM
  name = "k3s-agent-${count.index + 1}" #count.index starts at 0, so + 1 means this VM will be named test-vm-1 in proxmox

  # Specify VMID for the cluster
  vmid = "51${count.index + 1}"

  # this now reaches out to the vars file. I could've also used this var above in the pm_api_url setting but wanted to spell it out up there. 
  # target_node is different than api_url. target_node is which node hosts the template and thus also which node will host the new VM.
  # it can be different than the host you use to communicate with the API. the variable contains the contents "prox-1u"
  target_node = var.node1

  # Contains the VM to clone
  clone = var.template_name

  # Basic VM settings here. 
  # Agent refers to guest agent
  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    # set disk size here. leave it small for testing because expanding the disk takes time.
    size = "8G"
    type = "scsi"
    storage = "Arenas"
    iothread = 1
  }
  
  # If you want two NICs, just copy this whole network section and duplicate it
  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  # Not sure exactly what this is for. Presumably something about MAC addresses and ignore network changes during the life of the VM
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  
  # the ${count.index + 1} thing appends text to the end of the ip address
  # in this case, since we are only adding a single VM, the IP will
  # be 10.98.1.91 since count.index starts at 0. this is how you can create
  # multiple VMs and have an IP assigned to each (.91, .92, .93, etc.)
  ipconfig0 = "ip=172.16.16.4${count.index + 1}/24,gw=172.16.16.1"
  
  # SSH Keys settings
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}