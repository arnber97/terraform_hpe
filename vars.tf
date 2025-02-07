###################################
Default VAR
###################################
variable "tag" {
	type = string
	default = "Terraform VM ABR"
	}

###################################
WEB Server VAR
###################################
variable "vmname-web" {
    type = string
    default = "tf-vm-web"
}
variable "root_vol-size-web" {
	default = 25
	}
variable "local_vol-size-web" {
	default = 5
	}
###################################
APP Server VAR
###################################
variable "vmname-app" {
    type = string
    default = "tf-vm-app"
}
variable "root_vol-size-app" {
	default = 25
	}
variable "local_vol-size-app" {
	default = 5
	}
###################################
BDD Server VAR
###################################
variable "vmname-bdd" {
    type = string
    default = "tf-vm-bdd"
}
variable "root_vol-size-bdd" {
	default = 25
	}
variable "local_vol-size-bdd" {
	default = 5
	}
