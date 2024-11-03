# Azure VM Setup with Terraform

This repository contains Terraform configuration files for setting up a Virtual
Machine (VM) in Microsoft Azure.

## Files Overview

- `main.tf`: The main Terraform configuration file that defines the resources
to be created.
- `outputs.tf`: Contains output definitions for the Terraform deployment.
- `ssh.tf`: Manages the generation of SSH keys.
- `variables.tf`: Defines the input variables for the Terraform configuration.
- `providers.tf`: Specifies the required providers for the Terraform
configuration.
- `.terraform.lock.hcl`: Lock file for Terraform providers.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/install)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure account with sufficient permissions to create resources.

## Usage

Run the following commands to create the resources:

```bash
az login  # Log in to your Azure account and choose the subscription

cd terraform  # Change to the Terraform configuration directory
terraform init  # Initialize the Terraform configuration
terraform plan -out main.tfplan  # Create an execution plan
terraform apply main.tfplan  # Apply the execution plan
```
