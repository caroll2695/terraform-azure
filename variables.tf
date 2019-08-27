variable "location" {
  description = "Azure region"
  default     = "westus"
}

variable "app_profile" {
  description = "Application server profiles"
  default = {
    name = "app-0"
    username = "csgeorge"
    password = "p@ss123AMOSrocks"
    }  
}

variable "vnet_cidr" {
  description = "CIDR for vnet"
  default     = "10.128.0.0/16"
}

variable "subnet_cidrs" {
  description = "CIDRs for subnets"
  default     = {
    public_subnet  = "10.128.0.0/24"
    private_subnet = "10.128.1.0/24"
  }
}
