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
    Name = "webapp"
  }
}


resource "aws_instance" "jenkins_master" {
  ami = "ami-0399b1f276c3e2999"
  instance_type = "t3.micro"
  key_name = aws_key_pair.webapp_key.id
  vpc_security_group_ids = [aws_security_group.jenkins_master.id]
  tags = {
    Name = "jenkins_master"
  }
}

resource "aws_key_pair" "webapp_key" {
  key_name = "webapp"
  public_key = file("/home/niv/.ssh/id_ed25519.pub")
}


resource "aws_security_group" "webapp" {
description = "webapp security_group"
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
        ingress {
      cidr_blocks            = [
               "77.126.1.229/32",
      ]
      description            = null
      from_port = 22
      protocol = "tcp"
      to_port = 22
    }
    name        = "webapp_sc"
    vpc_id      = "vpc-0daa5961ce2929e7a"
}

resource "aws_security_group" "jenkins_master" {
description = "jenkins_master security_group"
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
            from_port        = 8080
            protocol         = "tcp"
            to_port          = 8080
        }
    ingress {
      cidr_blocks            = [
               "77.126.1.229/32",
      ]
      description            = null
      from_port = 22
      protocol = "tcp"
      to_port = 22
    }
    name        = "jenkins_master_sc"
    vpc_id      = "vpc-0daa5961ce2929e7a"
} 

