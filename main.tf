terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "il-central-1"
  profile = "niv"
}

resource "aws_instance" "webapp" {
  ami = "ami-0399b1f276c3e2999"
  instance_type = "t3.micro"
  key_name = aws_key_pair.webapp_key.id
  vpc_security_group_ids = [aws_security_group.webapp.id]
  tags = {
    Name = "webapp_jenkins"
  }
}


resource "aws_key_pair" "webapp_key" {
  key_name = "webapp_jenkins"
  public_key = file("/root/.ssh/id_rsa.pub")
}

output "web_public_ip" {
  value = aws_instance.webapp.public_ip
  description = "webapp public ip"
}


resource "aws_security_group" "webapp" {
description = "webapp_jenkins security_group"
    egress   {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = null
            from_port        = 0
            protocol         = "-1"
            to_port          = 0
        }
    ingress  {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = null
            from_port        = 3000
            protocol         = "tcp"
            to_port          = 3000
        }
    ingress  {
            cidr_blocks      = [
                "0.0.0.0/0",
        ]
        description          = null
        from_port            = 5000
        protocol             = "tcp"
        to_port              = 5000
       }
    ingress  {
            cidr_blocks      = [
                "0.0.0.0/0",
        ]
        description          = null
        from_port            = 5432
        protocol             = "tcp"
        to_port              = 5432
       }
        ingress {
      cidr_blocks            = [
               "0.0.0.0/0",
      ]
      description            = null
      from_port = 22
      protocol = "tcp"
      to_port = 22
    }
    name        = "webapp_jenkins_sc"
    vpc_id      = "vpc-0daa5961ce2929e7a"
}

