# main.tf

# Llamada al módulo de red (VPC, subnets, etc.)
module "vpc" {
  source      = "./modules/vpc"
  project     = var.project
  environment = var.environment
  cidr_block  = var.vpc_cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  az_a = var.az_a
}

