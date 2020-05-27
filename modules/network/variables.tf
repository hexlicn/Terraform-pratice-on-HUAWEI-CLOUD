variable "vpc_name" {
    
}
variable "vpc_cidr" {
    default = "172.25.0.0/16"         # Please change this item to specific vpc cidr
}
variable "subnet_name" {
    
}
variable "subnet_cidr" {
    default = "172.25.2.0/24"         # Please change this item to specific subnet cidr 
}
variable "subnet_gateway_ip" {
    default = "172.25.2.1"             # Please change this item to specific vpc gateway id
}
variable "secgroup_name" {
    
}
variable "sgs" {
    default = [{
      name = "demo.secgroup",
      rules = [{
        direction = "ingress",
        ethertype = "IPv4",
        protocol = "tcp",
        port_range_min = "22",         # Please change this item to specific virtual firewall ports
        port_range_max = "22",         # Please change this item to specific virtual firewall ports
        remote_ip_cidr = "0.0.0.0/0"
    },
    {
        direction = "ingress",
        ethertype = "IPv4",
        protocol = "tcp",
        port_range_min = "80",         # Please change this item to specific virtual firewall ports
        port_range_max = "80",         # Please change this item to specific virtual firewall ports
        remote_ip_cidr = "0.0.0.0/0"
    },
    {
        direction = "ingress",
        ethertype = "IPv4",
        protocol = "tcp",
        port_range_min = "443",        # Please change this item to specific virtual firewall ports
        port_range_max = "443",        # Please change this item to specific virtual firewall ports
        remote_ip_cidr = "0.0.0.0/0"
        },
      ],
    }, 
  ]
}
variable "peer_conn_name" {
    default = "Peer10-Seidor_SAP_B1_Cloud"
}