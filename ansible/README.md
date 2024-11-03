# Ansible Playbook for Azure VM Setup

This directory contains an Ansible playbook to perform tasks on the Azure Virtual
Machine (VM) created using Terraform.

## Playbook Overview

- **playbook.yaml**: Defines tasks to ping hosts and print a "Hello world!" message.

## Usage

To run the Ansible playbook, ensure you have Ansible installed and SSH access to
the Azure VM. Update your inventory file to include the VM's public IP address, e.g.:

```ini
[myhosts]
<public_ip_address> ansible_python_interpreter=/usr/bin/python3.12
```

Then execute:

```bash
ansible-playbook 
  -i <path_to_inventory_file>
  --private-key ../.secrets/private_key
  -u azureadmin
  playbook.yaml
```
