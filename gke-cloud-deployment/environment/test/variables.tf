variable "project_id" {
    type = string
}

## VPC

variable "network_name" {
    default = "k8s-vpc"
}
variable "auto_create_subnetworks" {
    default = false
}
# variable "routing_mode" {
#     default = "GLOBAL"
# }
variable "shared_vpc_host" {
    default = false
}
variable "delete_default_internet_gateway_routes" {
    default = false
}
variable "mtu" {
    default = 0
}

## SUBNET
variable "subnets" {
    default = [
        {
            subnet_name = "subnet-k8s"
            subnet_ip = "10.10.10.0/24"
            subnet_region = "asia-southeast1-a"
        }
    ]
}
# variable "secondary_ranges" {
#     default = 
# }