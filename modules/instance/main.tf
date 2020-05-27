#-----ECS: OpenStack API
resource "huaweicloud_ecs_instance_v1" "instance_hana" {
    availability_zone   = var.instance_az
    name                = var.instance_name_hana
    image_id            = var.instance_image_id_hana
    flavor              = var.instance_flavor_name_hana
    vpc_id              = var.instance_vpc_id

    nics {
        network_id = var.instance_network_id
    }

    system_disk_type = "SAS"
    system_disk_size = 836

    delete_disks_on_termination = true
    password         = "Welcome1"        # Must specify, but not used
    #charging_mode    = "prePaid"
    #period_unit      = "month"
    #period           = 1
}

resource "huaweicloud_compute_floatingip_associate_v2" "eip_hana" {
    floating_ip = var.instance_eip_address_hana
    instance_id = huaweicloud_ecs_instance_v1.instance_hana.id
}

resource "huaweicloud_ecs_instance_v1" "instance_app" {
    availability_zone   = var.instance_az
    name                = var.instance_name_app
    image_id            = var.instance_image_id_app
    flavor              = var.instance_flavor_name_app
    vpc_id              = var.instance_vpc_id

    nics {
        network_id = var.instance_network_id
    }

    system_disk_type = "SAS"
    system_disk_size = 100

    data_disks {
        type = "SATA"
        size = 200
    }

    delete_disks_on_termination = true
    password         = "Welcome1"        # Must specify, but not used
    #charging_mode    = "prePaid"
    #period_unit      = "month"
    #period           = 1
}

resource "huaweicloud_compute_floatingip_associate_v2" "eip_app" {
    floating_ip = var.instance_eip_address_app
    instance_id = huaweicloud_ecs_instance_v1.instance_app.id
}

resource "huaweicloud_ecs_instance_v1"  "instance_ts" {
    availability_zone   = var.instance_az
    name                = var.instance_name_ts
    image_id            = var.instance_image_id_ts
    flavor              = var.instance_flavor_name_ts
    vpc_id              = var.instance_vpc_id

    nics {
        network_id = var.instance_network_id
    }

    system_disk_type = "SAS"
    system_disk_size = 100

    data_disks {
        type = "SATA"
        size = 200
    }

    delete_disks_on_termination = true
    password                    = "Welcome1"        # Must specify, but not used
    #charging_mode    = "prePaid"
    #period_unit      = "month"
    #period           = 1
}

resource "huaweicloud_compute_floatingip_associate_v2" "eip_ts" {
    floating_ip = var.instance_eip_address_ts
    instance_id = huaweicloud_ecs_instance_v1.instance_ts.id
}