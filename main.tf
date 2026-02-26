provider "aws" {
  region = var.region
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source          = "./modules/ec2"
  subnet_id       = module.vpc.public_subnet_id
  security_group  = module.security_group.sg_id
  instance_count  = var.instance_count
  instance_type   = var.instance_type
}





