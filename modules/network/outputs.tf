output "vpc_id" {
    value = "${huaweicloud_vpc_v1.vpc.id}"
}
output "network_id" {
    value = "${huaweicloud_vpc_subnet_v1.subnet.id}"
}
output "secgroup_name" {
    value = "${huaweicloud_networking_secgroup_v2.secgroup_1.name}"
}
output "hana_eip_address" {
    value = "${huaweicloud_vpc_eip_v1.eip_hana.publicip.0.ip_address}"
}
output "app_eip_address" {
    value = "${huaweicloud_vpc_eip_v1.eip_app.publicip.0.ip_address}"
}
output "ts_eip_address" {
    value = "${huaweicloud_vpc_eip_v1.eip_ts.publicip.0.ip_address}"
}