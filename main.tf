
######
# Google Network Module
######

module "vpc" {
  source = "./modules/vpc"

  create_vpc                      = var.create_vpc
  offset                          = var.offset
  auto_create_subnetworks         = var.auto_create_subnetworks
  routing_mode                    = var.routing_mode
  labels                          = var.labels
  project_id                      = var.project_id
  description                     = var.description
  delete_default_routes_on_create = var.delete_default_routes_on_create
  shared_vpc_host                 = var.shared_vpc_host
}

module "public" {
  source = "./modules/subnets"

  project_id       = var.project_id
  labels           = var.labels
  network_name     = module.vpc.name
  secondary_ranges = var.secondary_ranges
  subnets          = var.public_subnets
}

module "intra" {
  source = "./modules/subnets"

  project_id       = var.project_id
  labels           = var.labels
  network_name     = module.vpc.name
  secondary_ranges = var.secondary_ranges
  subnets          = var.intra_subnets
}

module "private" {
  source = "./modules/subnets"

  project_id       = var.project_id
  labels           = var.labels
  network_name     = module.vpc.name
  secondary_ranges = var.secondary_ranges
  subnets          = var.private_subnets
}

module "firewall" {
  source = "./modules/firewall"

  project_id   = var.project_id
  labels       = var.labels
  network_name = module.vpc.name

  subnetworks = [for n in merge(module.intra.subnets, module.public.subnets) : n.ip_cidr_range]
}

module "cloud_nat" {
  source = "./modules/cloud_nat"

  create_vpc         = var.create_vpc
  enable_nat_gateway = var.enable_nat_gateway
  project_id         = var.project_id
  labels             = var.labels
  network_name       = module.vpc.name

  subnetworks = [for n in module.intra.subnets : tomap({ "${n.name}" = "${n.region}" })]
}

module "routes" {
  source = "./modules/routes"

  project_id   = var.project_id
  labels       = var.labels
  network_name = module.vpc.name
  routes       = var.routes

  depends_on = [module.public, module.intra, module.private]
}
