output "vm_scale_set_name" {
  value       = azurerm_linux_virtual_machine_scale_set.adoagents.name
  description = "The name of the provisioned VMSS"
}

output "admin_password" {
  value       = random_password.adoagents_password.result
  description = "The password of the administrator on each VMSS instance"
  sensitive   = true
}

output "vm_scale_set_id" {
  value       = azurerm_linux_virtual_machine_scale_set.adoagents.id
  description = "The resource id of the VMSS"
}
