#определяем id, имя ВМ, целевой сервер и ресурсы ВМ.
resource "proxmox_vm_qemu" "srv-docker" {
 count = 2
 vmid             = "${count.index+181}"
 name             = "srv${count.index+181}"
 target_node      = "pve"
 agent            = 1
 cpu {
      cores    = 4
      sockets  = 1
      type     = "host"
  }
 balloon          = 8192
 memory           = 8192
 boot             = "order=scsi0"
 clone            = "RockyLinux10" #выбираем, с какого темплейта клонируем
 full_clone       = true
 scsihw           = "virtio-scsi-single"
 vm_state         = "running"
 automatic_reboot = true

 #cicustom   = "vendor=local:snippets/cloud-init.yml" 
 ciupgrade  = true
 nameserver = ""
# ipconfig0  = "ip=192.168.88.${count.index+181}/24,gw=192.168.88.1"
 skip_ipv6  = true
 ciuser     = "pve"
 cipassword = "1"
 #sshkeys    = var.ssh_key
 
#эта секция не используется, нужна для защиты ВМ от случайного удаления при использовании командной строки terraform
 # lifecycle {
 #   prevent_destroy = true
 # }

 serial {
   id = 0
 }

 disks {
   scsi {
     scsi0 {
       disk {
         storage = "local-zfs"
         size    = "20G"
       }
     }
   }
 }

 network {
   id     = 0
   bridge = "vmbr0"
   model  = "virtio"
 }
}
