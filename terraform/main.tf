provider "aws" {
  region = "us-east-1"
   access_key = "AKIAWCYYAG7RKMSK7BMN"
   secret_key = "fjheXpQ/ILujrPnZPy7CLm2KBBTsFwcVIFYJi4Q"
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = "t2.micro"
  key_name      = "nvkey1"

  tags = {
    Name = "web-server"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory"
  }
}
