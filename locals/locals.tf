

locals {

    ami_id = "ami-090252cbe067a9e58"
    Sg_id =  "sg-00582685c0b1beb17"   ## replace with your sg-id
    # instance_type = "t3.micro"
      instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro" 

    tags = {
        Name = "locals"
    }


}