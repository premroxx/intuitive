module "vpc-module" {
  source = "./vpc-module"

  name = "intuitive"
  region = "us-east-1"
  cidr_block = "10.0.0.0/16"
  public_subnet_cidr_blocks = ["10.0.0.0/24"]
  availability_zones = ["us-east-1a"]
  
  App = "demo"
  environment = "dev"

}

module "sg-module" {
  source = "./sg-module"

  vpc_id = module.vpc-module.id
}

module "ec2-module" {
  source = "./ec2-module"

  ec2_count = var.no_of_ec2
  vpc_id = module.vpc-module.id
  security_group_id = module.sg-module.security_group_id
  public_subnet_id = element(tolist(module.vpc-module.public_subnet_ids), 1)

  App = "demo"
  environment = "dev"
}

module "s3-module" {
  source = "./s3-module"
  bucket_name = "intuitive-prem-s3-us-east-1"
}
