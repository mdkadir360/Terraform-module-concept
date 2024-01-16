rgs = {
  rg1 = {
    name     = "kadir-resources"
    location = "West Europe"
  }
}


vnet = {
  vnet1 = {
    name                = "kadirvnet"
    address_space       = ["10.0.0.0/16"]
    location            = "westeurope"
    resource_group_name = "kadir-resources"
  }
}
subnet = {
  subnet1 = {
    name                 = "kadirfrontendsubnet"
    resource_group_name  = "kadir-resources"
    virtual_network_name = "kadirvnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "kadirbackendsubnet"
    resource_group_name  = "kadir-resources"
    virtual_network_name = "kadirvnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "kadir-resources"
    virtual_network_name = "kadirvnet"
    address_prefixes     = ["10.0.3.0/24"]
  }

}
pip = {
  pip1 = {
    name                = "frontendpip"
    resource_group_name = "kadir-resources"
    location            = "westeurope"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "backendpip"
    resource_group_name = "kadir-resources"
    location            = "westeurope"
    allocation_method   = "Static"
  }
  pip3 = {
    name                = "bastionpip"
    resource_group_name = "kadir-resources"
    location            = "westeurope"
    allocation_method   = "Static"
  }
  # pip4 = {
  #   name                = "loadbalancerpip"
  #   resource_group_name = "kadir-resources"
  #   location            = "easteurope"
  #   allocation_method   = "Static"
  # }


}
nic = {
  nic1 = {
    name                 = "frontendnic"
    location             = "westeurope"
    resource_group_name  = "kadir-resources"
    virtual_network_name = "kadirvnet"
    subnetname           = "kadirfrontendsubnet"
    ipname               = "frontendpip"
  }
  nic2 = {
    name                 = "backendnic"
    location             = "westeurope"
    resource_group_name  = "kadir-resources"
    virtual_network_name = "kadirvnet"
    subnetname           = "kadirbackendsubnet"
    ipname               = "backendpip"
  }

}
vm = {
  vm1 = {
    name                = "kadirfrontendvm"
    location            = "westeurope"
    resource_group_name = "kadir-resources"
    nicname             = "frontendnic"
  }
  vm2 = {
    name                = "kadirbackendvm"
    location            = "westeurope"
    resource_group_name = "kadir-resources"
    nicname             = "backendnic"

  }

}
sqlservers = {
  sqlserver1 = {
    name                = "kadirsqlservertest"
    resource_group_name = "kadir-resources"
    location            = "westeurope"
  }
}
sqldata = {
  sqldata1 = {
    name                = "kadir_database"
    servername          = "kadirsqlservertest"
    resource_group_name = "kadir-resources"
  }
}

bastionhost = {
  bastionhost1 = {
    name                 = "kadirhost"
    location             = "westeurope"
    resource_group_name  = "kadir-resources"
    virtual_network_name = "kadirvnet"
    subnetname           = "AzureBastionSubnet"
    ipname               = "bastionpip"
  }
}
# loadbalancer = {
#     lb1 = {
#          name                = "kadirloadbalancer"
#          location            = "westeurope"
#          resource_group_name = "kadir-resources"
#         ipname =              "loadbalancerpip"
#     }
# }