data "aws_ami" "centos8" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["718756811784"]
}

output "ami" {
  value = data.aws_ami.centos8
}

output "public_ip" {
  value = data.aws_instance.foo.public_ip
}

output "private_ip" {
  value = data.aws_instance.foo.private_ip
}

data "aws_instance" "foo" {
  instance_id = "i-06e2e6e79c3ee2917"
}

provider "aws" {
  region = "us-east-1"
}