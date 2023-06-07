variable "ami" {}
variable "name" {}

resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = "t2.micro"

  tags = {
    Name = var.name
  }
}