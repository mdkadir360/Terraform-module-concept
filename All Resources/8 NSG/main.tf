resource "azurerm_network_security_group" "example" {
  for_each = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name


  dynamic "security_rule" {
    for_each = var.sequrity_rule
    content {
     name                     = sequrity_rule.value.name
    priority                   = sequrity_rule.value.priority
    direction                  = sequrity_rule.value.direction
    protocol                   = sequrity_rule.value.protocol
    source_port_range          = sequrity_rule.value.source_port_range
    destination_port_range     = sequrity_rule.value.destination_port_range
    source_address_prefix      = sequrity_rule.value.source_address_prefix
    destination_address_prefix = sequrity_rule.value.destination_address_prefix
    }
     
      }
    
  }

    
  

