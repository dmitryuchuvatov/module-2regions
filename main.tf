module "server1" {
  source = "./module"
  ami    = var.ami1
  name   = var.name1
}

module "server2" {
  source = "./module"
  ami    = var.ami2
  name   = var.name2
  
  providers = {
    aws = aws.london
  }
}