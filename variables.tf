variable "vm_name" {
    type = string
    description = " This is the name for the vm name in string" 
}

variable "user_name" {
    type = string
    description = " This is the admin userName "
}

variable "vm_size"{
    type = string
    description = "This is the vm size "
    default = "Standard_B2s"
}

variable "admin_password" {
     type = string
    description = "This is the admin password "
    default = "Azure@123!"

}
