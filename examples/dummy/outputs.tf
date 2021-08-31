
output "dummy_network_id" {
  description = "An identifier of the network resource"
  value       = module.network.network_id
}

output "dummy_network_name" {
  description = "The name of the network resource"
  value       = module.network.network_name
}

output "dummy_network_self_link" {
  description = "The URI of the network resource"
  value       = module.network.network_self_link
}

output "dummy_public_subnetwork_names" {
  description = "The names of the subnet resource"
  value       = module.network.public_subnet_names
}

output "dummy_public_subnetwork_ips" {
  description = "The IPs and CIDRs of the subnet resources"
  value       = module.network.public_subnet_ips
}

output "dummy_intra_subnetwork_names" {
  description = "The names of the subnet resource"
  value       = module.network.intra_subnet_names
}

output "dummy_intra_subnetwork_ips" {
  description = "The IPs and CIDRs of the subnet resources"
  value       = module.network.intra_subnet_ips
}

output "dummy_private_subnetwork_names" {
  description = "The names of the subnet resource"
  value       = module.network.private_subnet_names
}

output "dummy_private_subnetwork_ips" {
  description = "The IPs and CIDRs of the subnet resources"
  value       = module.network.private_subnet_ips
}

output "dummy_router_names" {
  description = "The names of the router resources"
  value       = module.network.router_names
}

output "dummy_router_self_links" {
  description = "The URI of the router resources"
  value       = module.network.router_self_links
}

output "dummy_nat_names" {
  description = "The names of the cloud NAT resources"
  value       = module.network.nat_names
}
