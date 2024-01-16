module "Rgs" {
  source = "../All Resources/1 RG"
  rgs    = var.rgs
}

module "vnet" {
  source     = "../All Resources/4 Virtual network"
  vnet       = var.vnet
  depends_on = [module.Rgs]
}
module "subnet" {
  source     = "../All Resources/5 Subnet"
  subnet     = var.subnet
  depends_on = [module.vnet]
}
module "pip" {
  source     = "../All Resources/6 Publicip"
  pip        = var.pip
  depends_on = [module.Rgs]
}
module "nic" {
  source     = "../All Resources/7 Nic"
  nic        = var.nic
  depends_on = [module.Rgs, module.subnet, module.vnet, module.pip]
}
module "vm" {
  source     = "../All Resources/10 Linux vm"
  vm         = var.vm
  depends_on = [module.Rgs, module.nic, module.pip]
}
module "sqlserver" {
  source     = "../All Resources/11 sqlserver"
  sqlserver  = var.sqlservers
  depends_on = [module.Rgs]
}
module "sqldata" {
  source     = "../All Resources/12 Sql database"
  sqldata    = var.sqldata
  depends_on = [module.Rgs, module.sqlserver]
}
module "bastionhost" {
  source      = "../All Resources/13 Bastion"
  bastionhost = var.bastionhost
  depends_on  = [module.Rgs, module.nic, module.pip, module.subnet]

}
# module "loadbalancer" {
#   source = "../one by one vm/14 Load balancer"
#   loadbalancer =var.loadbalancer 
# }