# Azure VM Setup with Terraform

This repository contains configuration files to set up a Virtual Machine (VM) in Microsoft Azure using Terraform and Ansible.

## Prerequisites

Ensure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/install)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- An Azure account with sufficient permissions to create resources.

## Usage

To create and provision the VM, run:

```bash
make
```

This command will initialize Terraform, apply the configuration, fetch necessary
outputs, and provision the VM using Ansible.

To SSH into the VM, run:

```bash
ssh -i .secrets/private_key \
  azureadmin@$(terraform -chdir=terraform output -raw public_ip_address)
```

## Individual Commands

- Initialize Terraform: `make init`
- Apply Terraform Configuration: `make apply`
- Provision VM: `make provision`
- Destroy Resources: `make destroy`

## Notes

Ensure you're logged into Azure CLI before running the `make` commands.
