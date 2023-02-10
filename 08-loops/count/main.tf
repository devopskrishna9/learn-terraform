resource "aws_instance" "web" {
#  count         = length(var.components)
  count = 1
  ami           = data.aws_ami.centos8.id
  instance_type = "t3.micro"

  tags = {
    Name = var.components[count.index]
  }
}


data "aws_ami" "centos8" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}


output "publicip" {
  # without count
  #value = aws_instance.web.public_ip

  # with count
  value = aws_instance.web.*.public_ip
}

#variable "components" {
#  default = ["cart", "catalogue"]
#}
