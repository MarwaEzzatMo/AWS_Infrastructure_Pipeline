#network module 
module "network" {
  source         = "./network"
  name           = var.name
  vpc_cidr       = var.vpc_cidr
  region         = var.region
  public_1_cidr  = var.public_1_cidr
  public_2_cidr  = var.public_2_cidr
  private_1_cidr = var.private_1_cidr
  private_2_cidr = var.private_2_cidr

}