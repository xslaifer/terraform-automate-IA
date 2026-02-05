# main.tf

# Llamada al módulo de red (VPC, subnets, etc.)
module "vpc" {
  source              = "./modules/vpc"
  project             = var.project
  environment         = var.environment
  cidr_block          = var.vpc_cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  public2_subnet_cidr = var.public2_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  az_a                = var.az_a
  az_b                = var.az_b
}

module "sg" {
  source  = "./modules/sg"
  project = var.project
  vpc_id  = module.vpc.vpc_id
}

module "iam" {
  source  = "./modules/iam"
  project = var.project
}




module "alb" {
  source            = "./modules/alb"
  project           = var.project
  vpc_id            = module.vpc.vpc_id
  alb_sg_id         = module.sg.alb_sg_id
  public_subnet_ids = [module.vpc.public_subnet_id, module.vpc.public2_subnet_id]
}

module "asg" {
  source             = "./modules/asg"
  project            = var.project
  instance_profile   = module.iam.instance_profile
  instance_sg_id     = module.sg.instance_sg_id
  private_subnet_ids = [module.vpc.private_subnet_id]
  target_group_arn   = module.alb.target_group_arn
  ami_id             = var.ami_id
}