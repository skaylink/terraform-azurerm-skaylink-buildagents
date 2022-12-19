# Skaylink Terraform azurerm build agent module

This repository contains the code for the Skaylink Terraform azurerm build agent module, which can be used for provisioning self-hosted build agents in your environment.

## Usage

An example usage of the module is provided below, here a VNet has been provisioned using the [skaylink-vnet](https://registry.terraform.io/modules/skaylink/skaylink-vnet/azurerm/latest) module. In the example a cloud config file called `agents-init.conf.tftpl` file is given as input:

```terraform
resource "azurerm_resource_group" "agent" {
  name     = "buildagent-rg"
  location = "West Europe" 
}

module "buildagents" {
  source              = "skaylink/skaylink-buildagents/azurerm"
  version             = "latest"

  agent_name          = "agent-vmss"
  resource_group_name = azurerm_resource_group.agent.name
  location            = azurerm_resource_group.agent.location
  subnet_id           = module.vnet.subnets["agents"].id
  cloud_init_config   = base64encode(templatefile("${path.root}/agents-init.conf.tftpl)
}
```
