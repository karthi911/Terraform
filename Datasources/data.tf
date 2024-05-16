data "aws_ami" "ami_id" {
     most_recent = true
        owners = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]

  }

 filter {

 name = "root-device-type"
 values = ["ebs"]
 }

 filter {

    name = "virtualization-type"
    values = ["hvm"]

 }


  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}

data "aws_vpc" "default" {

    default = true
}