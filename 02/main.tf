# Datatypes in Terraform

provider "aws" {
  region = "ap-south-1"
  #profile = "default"
}

resource "aws_elb" "bar" {
  name               = var.elb_name
  availability_zones = var.azs

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.idle_timeout
  connection_draining         = true
  connection_draining_timeout = 400

  tags = var.elb_tags
}


# Count and Count Index
resource "aws_instance" "test-vm" {
  count = 3
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1b"
  ami               = "ami-007855ac798b5175e"

  tags = {
    Name = "test-vm-${count.index}"
  }
}

# Locals
locals {
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# Count and List Index
resource "aws_s3_bucket" "s3_bucket" {

  count = 2

  bucket = var.s3_bucket_names[count.index]

  tags = local.tags
}