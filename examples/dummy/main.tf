
provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source = "../../"

  description        = var.description
  enable_nat_gateway = true

  public_subnets = [
    {
      subnet_name    = "public-subnet01"
      subnet_ip_cidr = "10.142.0.0/24"
      subnet_region  = "europe-west3"
    }
  ]

  intra_subnets = [
    {
      subnet_name    = "private-subnet02"
      subnet_ip_cidr = "10.142.1.0/24"
      subnet_region  = "europe-west3"
    }
  ]

  private_subnets = [
    {
      subnet_name    = "private-subnet03"
      subnet_ip_cidr = "10.142.2.0/24"
      subnet_region  = "europe-west3"
    }
  ]

  labels = var.labels
}
