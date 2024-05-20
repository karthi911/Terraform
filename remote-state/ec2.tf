resource "aws_instance" "db" {

    ami = "ami-090252cbe067a9e58"
    vpc_security_group_ids = ["sg-00582685c0b1beb17"]
    instance_type = "t3.micro"

    tags = {
        Name = "db"
    }
}