output "vm_scale_set_name" {
  value       = azurerm_linux_virtual_machine_scale_set.adoagents.name
  description = "The name of the provisioned Virtual Machine Scale Set"
}

output "admin_password" {
  value = random_password.adoagents_password.result
  description = "The password of the administrator on each Virtual Machine Scale Set instance"
  sensitive = true
}
