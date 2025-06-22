###cloud vars

variable "proxmox_host" {
    default = "pve"
}

#variable "template_name" {
#    default = "ubRockyLinux10"
#}

variable "ssh_key" {
  description = "Path to public SSH key file"
  type        = string
  default = "~/.ssh/id_ed25519.pub"
}