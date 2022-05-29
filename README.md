# Google Network Terraform Module

Terraform module which creates a network on GCP.

Inspired by and adapted from [this](https://registry.terraform.io/modules/terraform-google-modules/network)
and its [source code](https://github.com/terraform-google-modules/terraform-google-network).

* [GCP Compute Network](https://www.terraform.io/docs/providers/google/r/compute_network.html)
* [GCP Compute Subnetwork](https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html)
* [GCP Compute Route](https://www.terraform.io/docs/providers/google/r/compute_route.html)
* [GCP Compute Firewall](https://www.terraform.io/docs/providers/google/r/compute_firewall.html)

## Terraform versions

Only Terraform 0.14 is supported.

## Usage

```hcl
module "network" {
  source = "git@github.com:lucasberlang/gcp-network.git"

  [...]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_nat"></a> [cloud\_nat](#module\_cloud\_nat) | ./modules/cloud_nat | n/a |
| <a name="module_firewall"></a> [firewall](#module\_firewall) | ./modules/firewall | n/a |
| <a name="module_intra"></a> [intra](#module\_intra) | ./modules/subnets | n/a |
| <a name="module_private"></a> [private](#module\_private) | ./modules/subnets | n/a |
| <a name="module_public"></a> [public](#module\_public) | ./modules/subnets | n/a |
| <a name="module_routes"></a> [routes](#module\_routes) | ./modules/routes | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | Should be true to create a subnet for each region automatically | `bool` | `false` | no |
| <a name="input_create_vpc"></a> [create\_vpc](#input\_create\_vpc) | Controls if VPC should be created | `bool` | `true` | no |
| <a name="input_delete_default_routes_on_create"></a> [delete\_default\_routes\_on\_create](#input\_delete\_default\_routes\_on\_create) | Should be true to delete default routes (0.0.0.0/0) after network creation | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | An optional description of this resource | `string` | `""` | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | Should be true to provision NAT Gateways for each intra networks | `bool` | `false` | no |
| <a name="input_intra_subnets"></a> [intra\_subnets](#input\_intra\_subnets) | List of intranet subnetworks to associate with the network\_name | `list(map(string))` | `[]` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A mapping of labels to assign to all resources | `map(string)` | n/a | yes |
| <a name="input_offset"></a> [offset](#input\_offset) | The offset to be added to the VPC counter | `number` | `1` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnetworks to associate with the network\_name | `list(map(string))` | `[]` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the resource belongs | `string` | `null` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | List of public subnetworks to associate with the network\_name | `list(map(string))` | `[]` | no |
| <a name="input_routes"></a> [routes](#input\_routes) | List of routes to associate with the network\_name | `list(map(string))` | `[]` | no |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | The network-wide routing mode to use | `string` | `"GLOBAL"` | no |
| <a name="input_secondary_ranges"></a> [secondary\_ranges](#input\_secondary\_ranges) | Secondary ranges that will be used in some of the subnets | `map(list(object({ range_name = string, ip_cidr_range = string })))` | `{}` | no |
| <a name="input_shared_vpc_host"></a> [shared\_vpc\_host](#input\_shared\_vpc\_host) | Should be true to makes project\_id a Shared VPC host project | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_intra_subnet_ips"></a> [intra\_subnet\_ips](#output\_intra\_subnet\_ips) | The IPs and CIDRs of the intra subnet resources |
| <a name="output_intra_subnet_names"></a> [intra\_subnet\_names](#output\_intra\_subnet\_names) | The names of the intra subnet resource |
| <a name="output_intra_subnet_self_links"></a> [intra\_subnet\_self\_links](#output\_intra\_subnet\_self\_links) | The self-links of the intra subnet resources |
| <a name="output_nat_names"></a> [nat\_names](#output\_nat\_names) | The names of the cloud NATs resources |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | An identifier of the network resource |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | The name of the network resource |
| <a name="output_network_self_link"></a> [network\_self\_link](#output\_network\_self\_link) | The URI of the network resource |
| <a name="output_private"></a> [private](#output\_private) | The instance tag indicating network private topology |
| <a name="output_private_restricted"></a> [private\_restricted](#output\_private\_restricted) | The instance tag indicating network restricted topology |
| <a name="output_private_subnet_ips"></a> [private\_subnet\_ips](#output\_private\_subnet\_ips) | The IPs and CIDRs of the private subnet resources |
| <a name="output_private_subnet_names"></a> [private\_subnet\_names](#output\_private\_subnet\_names) | The names of the intra private resource |
| <a name="output_private_subnet_self_links"></a> [private\_subnet\_self\_links](#output\_private\_subnet\_self\_links) | The self-links of the private subnet resources |
| <a name="output_public"></a> [public](#output\_public) | The instance tag indicating network public topology |
| <a name="output_public_subnet_ips"></a> [public\_subnet\_ips](#output\_public\_subnet\_ips) | The IPs and CIDRs of the public subnet resources |
| <a name="output_public_subnet_names"></a> [public\_subnet\_names](#output\_public\_subnet\_names) | The names of the public subnet resource |
| <a name="output_public_subnet_self_links"></a> [public\_subnet\_self\_links](#output\_public\_subnet\_self\_links) | The self-links of the public subnet resources |
| <a name="output_route_names"></a> [route\_names](#output\_route\_names) | The route names associated with this VPC |
| <a name="output_router_names"></a> [router\_names](#output\_router\_names) | The names of the router resources |
| <a name="output_router_self_links"></a> [router\_self\_links](#output\_router\_self\_links) | The URI of the router resources |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Test

### Environment

Since most automated tests written with Terratest can make potentially destructive changes in your environment, we
strongly recommend running tests in an environment that is totally separate from production. For example, if you are
testing infrastructure code for GCP, you should run your tests in a completely separate GCP account.

### Requirements

Terratest uses the Go testing framework. To use terratest, you need to install:

* [Go](https://golang.org/) (requires version >=1.13)

### Running

Now you should be able to run the example test.

1. Change your working directory to the `test/src` folder.
1. Each time you want to run the tests:

```bash
go test -timeout 20m
```

### Terraform CLI

On the `examples/dummy` folder, perform the following commands.

* Get the plugins:

```bash
terraform init
```

* Review and apply the infrastructure test build:

```bash
terraform apply -var-file=fixtures.europe-west3.tfvars
```

* Remove all resources:

```bash
terraform destroy -auto-approve
```
