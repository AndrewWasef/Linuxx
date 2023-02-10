module "network" {
  source                     = "./network"
  vpc_CIDR_block             = var.vpc_CIDR_block
  public-subnet1_CIDR_block  = var.public-subnet1_CIDR_block
  public-subnet2_CIDR_block  = var.public-subnet2_CIDR_block
  private-subnet1_CIDR_block = var.private-subnet1_CIDR_block
  private-subnet2_CIDR_block = var.private-subnet2_CIDR_block
}