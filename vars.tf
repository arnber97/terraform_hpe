variable "vmname" {
    type = string
    default = "tf-vm-abr1"
}
variable "root_vol-size" {
	default = 25
	}
variable "local_vol-size" {
	default = 5
	}
variable "tag" {
	type = string
	default = "Terraform VM ABR"
	}
