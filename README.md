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
  source = "git::ssh://git@vliamd634.cloud.bankia.int:7999/ter/gcp-network.git?ref=v0.1.0"

  [...]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| google | ~> 3.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_create\_subnetworks | Should be true to create a subnet for each region automatically | `bool` | `false` | no |
| create\_vpc | Controls if VPC should be created | `bool` | `true` | no |
| delete\_default\_routes\_on\_create | Should be true to delete default routes (0.0.0.0/0) after network creation | `bool` | `false` | no |
| description | An optional description of this resource | `string` | `""` | no |
| enable\_nat\_gateway | Should be true to provision NAT Gateways for each intra networks | `bool` | `false` | no |
| intra\_subnets | List of intranet subnetworks to associate with the network\_name | `list(map(string))` | `[]` | no |
| labels | A mapping of labels to assign to all resources | `map(string)` | n/a | yes |
| private\_subnets | List of private subnetworks to associate with the network\_name | `list(map(string))` | `[]` | no |
| project\_id | The ID of the project in which the resource belongs | `string` | `null` | no |
| public\_subnets | List of public subnetworks to associate with the network\_name | `list(map(string))` | `[]` | no |
| routes | List of routes to associate with the network\_name | `list(map(string))` | `[]` | no |
| routing\_mode | The network-wide routing mode to use | `string` | `"GLOBAL"` | no |
| secondary\_ranges | Secondary ranges that will be used in some of the subnets | `map(list(object({ range_name = string, ip_cidr_range = string })))` | `{}` | no |
| shared\_vpc\_host | Should be true to makes project\_id a Shared VPC host project | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| intra\_subnet\_ips | The IPs and CIDRs of the intra subnet resources |
| intra\_subnet\_names | The names of the intra subnet resource |
| intra\_subnet\_self\_links | The self-links of the intra subnet resources |
| nat\_names | The names of the cloud NATs resources |
| network\_id | An identifier of the network resource |
| network\_name | The name of the network resource |
| network\_self\_link | The URI of the network resource |
| private | The instance tag indicating network private topology |
| private\_restricted | The instance tag indicating network restricted topology |
| private\_subnet\_ips | The IPs and CIDRs of the private subnet resources |
| private\_subnet\_names | The names of the intra private resource |
| private\_subnet\_self\_links | The self-links of the private subnet resources |
| public | The instance tag indicating network public topology |
| public\_subnet\_ips | The IPs and CIDRs of the public subnet resources |
| public\_subnet\_names | The names of the public subnet resource |
| public\_subnet\_self\_links | The self-links of the public subnet resources |
| route\_names | The route names associated with this VPC |
| router\_names | The names of the router resources |
| router\_self\_links | The URI of the router resources |

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
