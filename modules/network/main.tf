#-----VPC
resource "huaweicloud_vpc_v1" "vpc" {
    name = var.vpc_name
    cidr = var.vpc_cidr
}

#----subnet-----
resource "huaweicloud_vpc_subnet_v1" "subnet" {
    name        = var.subnet_name
    cidr        = var.subnet_cidr
    gateway_ip  = var.subnet_gateway_ip
    vpc_id      = huaweicloud_vpc_v1.vpc.id
}

#----secgroup
resource "huaweicloud_networking_secgroup_v2" "secgroup_1" {
    name = var.secgroup_name
}

#resource "huaweicloud_networking_secgroup_v2" "secgroup_1" {
#    count = "${length(var.sgs)}"
#    name  = "${lookup(var.sgs[count.index], "name")}"
#}

resource "huaweicloud_networking_secgroup_rule_v2" "secgroup_rule_1" {
     count             = length(lookup(var.sgs[0], "rules"))
     direction         = lookup(lookup(var.sgs[0], "rules")[count.index], "direction")
     ethertype         = lookup(lookup(var.sgs[0], "rules")[count.index], "ethertype")
     protocol          = lookup(lookup(var.sgs[0], "rules")[count.index], "protocol")
     port_range_min    = lookup(lookup(var.sgs[0], "rules")[count.index], "port_range_min")
     port_range_max    = lookup(lookup(var.sgs[0], "rules")[count.index], "port_range_max")
     remote_ip_prefix  = lookup(lookup(var.sgs[0], "rules")[count.index], "remote_ip_cidr")
     security_group_id = huaweicloud_networking_secgroup_v2.secgroup_1.*.id[0]
}


#resource "huaweicloud_networking_secgroup_rule_v2" "secgroup_rule_1" {
#    direction         = "ingress"
#    ethertype         = "IPv4"
#    protocol          = "tcp"
#    port_range_min    = 22
#    port_range_max    = 22
#    remote_ip_prefix  = "0.0.0.0/0"
#    security_group_id = "${huaweicloud_networking_secgroup_v2.secgroup_1.id}"
#}


#----peering
resource "huaweicloud_vpc_peering_connection_v2" "peering" {
    name        = var.peer_conn_name
    vpc_id      = huaweicloud_vpc_v1.vpc.id
    #peer_vpc_id = var.accepter_vpc_id
    peer_vpc_id = "03bfd292-7c4b-4e63-8074-6668a9be23a9"                      # This is shared VPC ID
}

#----local route
resource "huaweicloud_vpc_route_v2" "vpc_route_local" {
    type        = "peering"
    nexthop     = huaweicloud_vpc_peering_connection_v2.peering.id
    destination = "172.17.2.0/24"                                             # This is shared VPC subnet
    vpc_id      = "03bfd292-7c4b-4e63-8074-6668a9be23a9"                      # This is shared VPC ID
}

#----peer route
resource "huaweicloud_vpc_route_v2" "vpc_route_peer" {
    type        = "peering"
    nexthop     = huaweicloud_vpc_peering_connection_v2.peering.id
    destination = var.subnet_cidr
    vpc_id      = huaweicloud_vpc_v1.vpc.id
}

#----EIP
resource "huaweicloud_vpc_eip_v1" "eip_hana" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "Seidor-Traffic"   # You can customize bandwidth name
    size        = 10                 # You can change bandwidth size       
    share_type  = "PER"
    charge_mode = "traffic"
  }
}

resource "huaweicloud_vpc_eip_v1" "eip_app" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "Seidor-Traffic"
    size        = 10
    share_type  = "PER"
    charge_mode = "traffic"
  }
}

resource "huaweicloud_vpc_eip_v1" "eip_ts" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "Seidor-Traffic"
    size        = 10
    share_type  = "PER"
    charge_mode = "traffic"
  }
}