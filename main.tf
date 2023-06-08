# module - default provider
module "server1" {
  source = "./module"
  ami    = var.ami1
  name   = var.name1
}

# module - specific provider
module "server2" {
  source = "./module"
  providers = {
    aws = aws.london
  }
  
  ami    = var.ami2
  name   = var.name2
}
