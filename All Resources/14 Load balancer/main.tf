data "azurerm_public_ip" "ipdata" {
  for_each            = var.loadbalancer
  name                = each.value.ipname
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_lb" "loadbalancerblock" {
    for_each = var.loadbalancer
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = "lbipconfiguration"
    public_ip_address_id = data.azurerm_public_ip.ipdata[each.key].id
  }
}