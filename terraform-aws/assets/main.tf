# set variables
variable "name" {
  default= "demo"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.name
  }
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "deployer-${var.name}"
  public_key = tls_private_key.this.public_key_openssh
}

# Create ec2 instance
resource "aws_instance" "example" {
  key_name      = module.key_pair.this_key_pair_key_name
  ami           = "ami-2757f631"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

# Assigning an Elastic IP
resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}

# create s3 bucket
resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "terraform-getting-started-guide"
  acl    = "private"
}

output "vpc_id" {
  value = aws_vpc.example.id
}

output "aws_eip" {
  value = aws_eip.ip.public_ip
}
