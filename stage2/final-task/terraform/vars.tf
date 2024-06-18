variable "instance_count" {
    type = number
    default = 2
    description = "Number of Instance"
}

variable "vm_name" {
    type = string
    default = "Fadil"
    description = "VM Name"
}

variable "username" {
    type = string
    default = "fadil05me"
    description = "VM Username"
}

variable "spec" {
    type = string
    default = "Standard_D2_v2"
    description = "Specification size for VM"
}

variable "pubkey" {
    type = string
    default = "~/.ssh/id_rsa.pub"
    description = "Your Public key location"
}