#-----variable "instance_sg" {
#-----
#-----}
variable "instance_name_hana" {
    
}
variable "instance_name_app" {
    
}
variable "instance_name_ts" {
    
}
variable "instance_az" {
    default = "af-south-1a"
}
variable "instance_image_id_hana" {
    default = "45c682fd-8b8c-4c5c-9053-2724fbfc94e1"
    description = "SLES12SP4 SAPB1 Pri-IMG"
}
variable "instance_image_id_app" {
    default = "2131e1eb-d59c-4705-aac7-fc8751686f79"
    description = "WIN2K19 APP Pri-IMG"
}
variable "instance_image_id_ts" {
    default = "ab7b80b7-56b7-4ec2-a636-76766de19cc3"
    description = "WIN2K19 TS Pri-IMG"
}
variable "instance_flavor_name_hana" {
    default = "c3.4xlarge.4"                       # You can change to your Hana server flaovr
}
variable "instance_flavor_name_app" {
    default = "c3.large.4"                         # You can change to your Hana App server flaovr
}
variable "instance_flavor_name_ts" {
    default = "m3.large.8"                         # You can change to your TS server flaovr
}
variable "instance_vpc_id" {
    
}
variable "instance_network_id" {
    
}
variable "instance_security_group" {
  
}
variable "instance_eip_address_hana" {
  
}
variable "instance_eip_address_app" {
  
}
variable "instance_eip_address_ts" {
  
}