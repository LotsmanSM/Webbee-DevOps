#секция установки провайдера
terraform {
  required_providers {
    proxmox = {
      source = "registry.terraform.io/Telmate/proxmox"
      version = "3.0.2-rc01"
    }
  }
}


#секция подключения к кластеру/ноде
provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url      = "https://192.168.88.10:8006/api2/json"
  pm_password     = "1qA2wS3eD"
  pm_user         = "root@pam"
#  pm_api_token_id = "terraform-prov@pve!mytoken"
#  pm_api_token_secret = "3df9fc30-9b4e-4249-bb10-6036a31b37d6"
  pm_debug = true
}
