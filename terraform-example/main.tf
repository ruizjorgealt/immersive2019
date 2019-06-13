provider "aws" {
  # access_key = "foo"
  # secret_key = "bar"
  region = "us-east-2"
}

resource "aws_instance" "web" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  key_name               = "portfolio"
  subnet_id              = "subnet-c7a18faf"
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_http.id}"]

  user_data = <<-EOF
  #!/bin/bash
  apt-get update -y
  apt-get install python -y
  EOF

  tags {
    Name = "${var.ec2_instance_name}"
  }
}

variable "ec2_instance_name" {
  default     = "My EC2 Instance"
  description = "Name of EC2 instance"
  type        = "string"
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allows SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}