data "aws_ami" "ec2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "public1" {
  ami                    = data.aws_ami.ec2.id
  instance_type          = "t2.micro"
  subnet_id              = module.network.public_subnet1_id
  vpc_security_group_ids = ["${module.network.sg_1}"]

  tags = {
    Name = "Bastion"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip}"
  }
}

resource "aws_instance" "private" {
  ami                    = data.aws_ami.ec2.id
  instance_type          = "t2.micro"
  subnet_id              = module.network.private_subnet1_id
  vpc_security_group_ids = ["${module.network.sg_2}"]

  tags = {
    Name = "Application"
  }
}