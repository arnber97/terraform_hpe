terraform {
  required_providers {
    hpegl = {
      source  = "hpe/hpegl"
      version = "0.4.15"
    }
  }
}
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

# And a group
data "hpegl_vmaas_group" "default_group" {
  name = "GreenBoat"
}

# Locate a resource pool
data "hpegl_vmaas_resource_pool" "cl_resource_pool" {
     cloud_id = data.hpegl_vmaas_cloud.cloud.id
     name = "ComputeResourcePool"
   }

# A layout
data "hpegl_vmaas_layout" "vmware" {
     name = "Vmware VM"
     instance_type_code = "VMware"
}

#A Plan
data "hpegl_vmaas_plan" "g1-small" {
	name = "G1-Small"
}

# A Template
data "hpegl_vmaas_template" "rhel9ng" {
	name = "master-NG-RHEL9-beta-v0"
}

#An Environnement
data "hpegl_vmaas_environment" "dev" {
	name = "Dev"
}

#A Group
data "hpegl_vmaas_group" "greenboat"  {
	name = "GreenBoat"
}

# A Folder
data "hpegl_vmaas_cloud_folder" "folder" {
	cloud_id = data.hpegl_vmaas_cloud.cloud.id
	name = "ComputeFolder"
}
#########################################
# Ressources
#########################################
resource "hpegl_vmaas_instance" "TF1-ABR" {
	name = "tf1-abr"
	layout_id = data.hpegl_vmaas_layout.vmware.id
 	instance_type_code = data.hpegl_vmaas_layout.vmware.instance_type_code
	cloud_id = data.hpegl_vmaas_cloud.cloud.id
	group_id = data.hpegl_vmaas_group.greenboat.id
	plan_id = data.hpegl_vmaas_plan.g1-small.id
	network {
		id = data.hpegl_vmaas_network.green_net.id
		}
	volume {
		name = "root_vol"
		size = 25
		datastore_id = "auto"
		}
	volume {
		name = "local_vol"
		size = 5
		datastore_id = "auto"
		}
	config {
		template_id = data.hpegl_vmaas_template.rhel9ng.id
		resource_pool_id = data.hpegl_vmaas_resource_pool.cl_resource_pool.id
		no_agent = false
		asset_tag = "TF VM"
		folder_code = data.hpegl_vmaas_cloud_folder.folder.code
		}
	power = "poweron"
	}


