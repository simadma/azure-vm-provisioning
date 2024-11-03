# Terraform Configuration for Azure VM Setup

This directory contains Terraform configuration files to provision an Azure Virtual
Machine (VM) along with the necessary networking and security resources.

## Directory Structure

- `main.tf`: Contains the main configuration for creating the Azure resources.
- `outputs.tf`: Defines the outputs that will be displayed after the resources are
created.
- `providers.tf`: Specifies the required providers and their versions.
- `ssh.tf`: Manages the generation of SSH keys for secure access to the VM.
- `variables.tf`: Defines the input variables used in the configuration.

## Resources Created

The following resources are created by this configuration:

- **Resource Group**: A container for all the resources.
- **Virtual Network**: A virtual network for the VM.
- **Subnet**: A subnet within the virtual network.
- **Public IP Address**: A public IP for accessing the VM.
- **Network Security Group**: A security group with rules to allow SSH access.
- **Network Interface**: An interface for the VM to connect to the network.
- **Storage Account**: A storage account for boot diagnostics.
- **Linux Virtual Machine**: The actual VM that will be provisioned.

## Prerequisites

Before running the Terraform scripts, ensure you have:

- [Terraform](https://developer.hashicorp.com/terraform/install) installed.
- An Azure account with sufficient permissions to create resources.
- Azure CLI installed and authenticated.

## Usage

1. **Initialize Terraform**: Run the following command to initialize the Terraform
configuration:

   ```bash
   terraform init
   ```

2. **Plan the Deployment**: To see what resources will be created, run:

   ```bash
   terraform plan
   ```

3. **Apply the Configuration**: To create the resources, run:

   ```bash
   terraform apply
   ```

   Confirm the action when prompted.

4. **Access the VM**: After the resources are created, you can SSH into the VM using the public IP address outputted by Terraform:

   ```bash
   ssh -i ../.secrets/private_key \
     azureadmin@$(terraform output -raw public_ip_address)
   ```

5. **Destroy Resources**: To remove all the resources created by Terraform, run:

   ```bash
   terraform destroy
   ```

   Confirm the action when prompted.

## Outputs

After running `terraform apply`, the following outputs will be displayed:

- `resource_group_name`: The name of the created resource group.
- `remote_user`: The username for the VM.
- `public_ip_address`: The public IP address of the VM.
- `key_data`: The public SSH key for accessing the VM.
- `private_key_path`: The path to the generated private SSH key.

## Notes

- Ensure that the Azure CLI is logged in before running the Terraform commands.
- The SSH key will be generated and stored in the .secrets directory.
