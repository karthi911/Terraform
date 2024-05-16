resource "aws_instance" "db" {

    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type
 
 # Left Side things are called as arguments, Right sidef are values.
    tags = var.tags
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


       tags = var.sgt
  
    #tags = {
     #Name = "allow_ssh"
     #createdBy = "karthik"
 }

