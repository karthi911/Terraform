# resource "aws_instance" "db" {
#     count = 3      // count loop is used for adding count of instances in a loop
#     ami = var.image_id
#     vpc_security_group_ids = [aws_security_group.allow_ssh.id]
#     instance_type = var.instance_type == "db" ? "t3.small" : "t3.micro"
#      tags = {

#           Name = var.instance_names[count.index]
#      }


 
# }


resource "aws_instance" "db" {
    count = 3
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type[count.index] == "db" ? "t3.small" : "t3.micro"
    tags = {
        Name = var.instance_names[count.index]
    }
}


# resource <resorce-type> <resource name

resource "aws_security_group" "allow_ssh" {
    name  = var.sg_name
    description = var.sg_description
    # this is called as block not a map.
    ingress {
       from_port        = var.ssh_port
       to_port          = var.ssh_port
       protocol         = var.Protocol
       cidr_blocks      = var.allowed_cidr
    
    }


    egress {
        from_port        = 0  # from 0 to 0 means, Opening all protocols
        to_port          = 0
        protocol         = "-1"   # -1 all protocals
        cidr_blocks      = var.allowed_cidr
    }  


      
 }

