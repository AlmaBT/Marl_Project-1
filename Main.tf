resource "aws_instance" "docker_server" {
  ami = data.aws_ami.most_recent_amazon_linux_ami.id
  instance_type = "t2.micro"
  key_name = "Kuberenetes-keypair"
  associate_public_ip_address = true
  user_data = file("entry_script.sh")

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    private_key = file("private-Key.pem")
  }
  provisioner "file" {
    source = "Dockerfile"
    destination = "/home/ec2-user/Dockerfile"
  }
    provisioner "file" {
    source = "coffeshop-html"
    destination = "/home/ec2-user/coffeshop-html"
  }
  tags = {
    Name = "docker_tf_server"
  }
}

data "aws_ami" "most_recent_amazon_linux_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "default" {
   default = true 
   }

resource "aws_security_group" "Docker-project-sg" {
  name        = "Docker-project-sg"
  description = "sg for Docker-project"
  vpc_id      = data.aws_vpc.default.id
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow SSH"
    from_port   = 8000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Docker-project-sg"
  }
}
