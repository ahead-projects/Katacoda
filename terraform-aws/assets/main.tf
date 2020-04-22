# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# Create ec2 instance
resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}

# Assigning an Elastic IP
resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}
