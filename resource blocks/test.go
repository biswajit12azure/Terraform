package test

import (
    "testing"

    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestTerraformAzureResourceGroup(t *testing.T) {
    t.Parallel()

    terraformOptions := &terraform.Options{
        // The path to where your Terraform code is located
        TerraformDir: "../terraform/",

        // Variables to pass to Terraform
        Vars: map[string]interface{}{
            "resource_group_name": "example-resource-group",
        },
    }

    // Run `terraform init` and `terraform apply`
    terraform.InitAndApply(t, terraformOptions)

    // Check the Resource Group exists
    output := terraform.Output(t, terraformOptions, "resource_group_name")
    assert.Equal(t, "example-resource-group", output)

    // Clean up resources with `terraform destroy`
    defer terraform.Destroy(t, terraformOptions)
}
