package test

import (
    "testing"

    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

// Test the Terraform module in examples/dummy using Terratest
func TestExamplesComplete(t *testing.T) {
    t.Parallel()

    gcpRegion := "europe-west1"

    terraformOptions := &terraform.Options{
        // The path to where our Terraform code is defined
        TerraformDir: "../../examples/dummy",
        // The max line size of stdout and stderr
        OutputMaxLineSize: 128 * 1024,
        // Opt to upgrade modules and plugins as part of init step
        Upgrade: true,
        // Variables to pass through the -var-file option
        VarFiles: []string{"fixtures.europe-west3.tfvars"},
        // Environment variables to set when running Terraform
        EnvVars: map[string]string{
            "GOOGLE_REGION": gcpRegion,
        },
    }

    // Teardown: at the end of the test, destroy any resources that were created
    defer terraform.Destroy(t, terraformOptions)

    // This will setup the test and fail if there are any errors
    terraform.InitAndApply(t, terraformOptions)

    // Run terraform output to get the value of an output variable
    templateName := terraform.Output(t, terraformOptions, "dummy_network_name")
    // Verify we're getting back the outputs we expect
    assert.Equal(t, "go-euw3-bk-poc-operation-vpc01-epd", templateName)

    // Run terraform output to get the value of an output variable
    public_subnetworks := terraform.OutputList(t, terraformOptions, "dummy_public_subnetwork_names")
    // Verify we're getting back the outputs we expect
    assert.Equal(t, "go-euw3-bk-poc-public-subnet01-epd", public_subnetworks[0])

    // Run terraform output to get the value of an output variable
    intra_subnetworks := terraform.OutputList(t, terraformOptions, "dummy_intra_subnetwork_names")
    // Verify we're getting back the outputs we expect
    assert.Equal(t, "go-euw3-bk-poc-private-subnet02-epd", intra_subnetworks[0])

    // Run terraform output to get the value of an output variable
    private_subnetworks := terraform.OutputList(t, terraformOptions, "dummy_private_subnetwork_names")
    // Verify we're getting back the outputs we expect
    assert.Equal(t, "go-euw3-bk-poc-private-subnet03-epd", private_subnetworks[0])

    // Run terraform output to get the value of an output variable
    routers := terraform.OutputList(t, terraformOptions, "dummy_router_names")
    // Verify we're getting back the outputs we expect
    assert.Equal(t, "go-euw3-bk-poc-private-router01-epd", routers[0])

    // Run terraform output to get the value of an output variable
    nats := terraform.OutputList(t, terraformOptions, "dummy_nat_names")
    // Verify we're getting back the outputs we expect
    assert.Contains(t, nats[0], "go-euw3-bk-poc-private-nat01-epd")
}
