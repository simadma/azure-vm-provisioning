output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "remote_user" {
  value = var.username
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address
}

output "key_data" {
  value = azapi_resource_action.ssh_public_key_gen.output.publicKey
}

output "private_key_path" {
  value = abspath(local_sensitive_file.ssh_private_key.filename)
}

