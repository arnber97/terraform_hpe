#Environnement du provider
provider "hpegl" {
  vmaas {
    location   = "HPE"
    space_name = "Hosted-Trial-TR2-Space"
  }
}

# Retrieve Cloud ID
data "hpegl_vmaas_cloud" "cloud" {
  name = "HPE GreenLake VMaaS Cloud-Trial2"
}

# And a few networks
data "hpegl_vmaas_network" "blue_net" {
     name = "Blue-Net"
   }
data "hpegl_vmaas_network" "green_net" {
     name = "Green-Net"
   }
data "hpegl_vmaas_network" "greenboatz1_net" {
     name = "GreenBoat-Z1"
   }

# Group
data "hpegl_vmaas_group" "default_group" {
  name = "GreenBoat"
}

# Locate a resource pool
data "hpegl_vmaas_resource_pool" "cl_resource_pool" {
     cloud_id = data.hpegl_vmaas_cloud.cloud.id
     name = "ComputeResourcePool"
   }

# Layout
data "hpegl_vmaas_layout" "vmware" {
     name = "Vmware VM"
     instance_type_code = "VMware"
}

# Plan
data "hpegl_vmaas_plan" "g1-small" {
	name = "G1-Small"
}
data "hpegl_vmaas_plan" "g1-medium" {
	name = "G1-Medium"
}
data "hpegl_vmaas_plan" "g1-large" {
	name = "G1-Large"
}

# Template
data "hpegl_vmaas_template" "rhel9ng" {
	name = "master-NG-RHEL9-beta-v0"
}
data "hpegl_vmaas_template" "ubuntu-20" {
	name = "ubuntu-20"
}
data "hpegl_vmaas_template" "centos-7" {
	name = "vanilla-centos-7-x86_64-18062020"
}


# Environnement
data "hpegl_vmaas_environment" "dev" {
	name = "Dev"
}
data "hpegl_vmaas_environment" "test" {
	name = "Test"
}
data "hpegl_vmaas_environment" "production" {
	name = "Production"
}
# Group
data "hpegl_vmaas_group" "greenboat"  {
	name = "GreenBoat"
}

# Folder
data "hpegl_vmaas_cloud_folder" "folder" {
	cloud_id = data.hpegl_vmaas_cloud.cloud.id
	name = "ComputeFolder"
}
