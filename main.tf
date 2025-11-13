# main.tf

# Llamada al módulo de red (VPC, subnets, etc.)
module "vpc" {
  source      = "./modules/vpc"
  project     = var.project
  environment = var.environment
  cidr_block  = var.vpc_cidr_block
}

