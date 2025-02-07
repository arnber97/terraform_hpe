#########################################
# Ressources
#########################################
resource "hpegl_vmaas_instance" "TF2-ABR" {
	name = var.vmname
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
		size = var.root_vol-size
		datastore_id = "auto"
		}
	volume {
		name = "local_vol"
		size = var.local_vol-size
		datastore_id = "auto"
		}
	config {
		template_id = data.hpegl_vmaas_template.centos-7.id
		resource_pool_id = data.hpegl_vmaas_resource_pool.cl_resource_pool.id
		no_agent = false
		asset_tag = var.tag
		folder_code = data.hpegl_vmaas_cloud_folder.folder.code
		}
	power = "poweron"
	}


