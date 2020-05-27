#---provider
provider "huaweicloud" {
    access_key  = var.access_key
    secret_key  = var.secret_key
    tenant_name = "af-south-1"
    region      = var.region
    auth_url    = "https://iam.af-south-1.myhuaweicloud.com"
}

module "network" {
    source = "./modules/network"
    vpc_name = "vpc-${var.env}"
    subnet_name = "subnet-${var.env}"
    secgroup_name = "sg-${var.env}"
}

module "instance" {
    source = "./modules/instance"
    instance_name_hana = "test25user-hana01"      # Please change this item to Hana server 
    instance_flavor_name_hana = "c3.4xlarge.4"    # Please change this item to Hana server flavor
    instance_name_app = "test25user-app01"        # Please change this item to SAP App server
    instance_flavor_name_app = "c3.large.4"       # Please change this item to SAP App server flavor
    instance_name_ts = "test25user-ts01"          # Please change this item to TS server
    instance_flavor_name_ts = "m3.large.8"        # Please change this item to TS server flavor
    instance_security_group = "${module.network.secgroup_name}"
    instance_network_id = "${module.network.network_id}"
    instance_vpc_id = "${module.network.vpc_id}"
    instance_eip_address_hana = "${module.network.hana_eip_address}"
    instance_eip_address_app = "${module.network.app_eip_address}"
    instance_eip_address_ts = "${module.network.ts_eip_address}"
}