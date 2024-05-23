resource "aws_security_group" "allow_more_ports" {
    name  = "allow_more_ports"
    description = "Allowing all ports of 22,80,8080,3306 for access"


   ### Terraform Block
   
    dynamic "ingress"{
         
         for_each = var.ingress_rules
         content {

           from_port        = ingress.value["port"] # ingress.value [<key-name>] ## here we need to give only given name noyt each keyword in dynamic loop
           to_port          = ingress.value["port"]
           protocol         = ingress.value["protocol"]
           cidr_blocks      = ingress.value["allowed_cidr"]
         }
    }


    egress {
        from_port        = 0  # from 0 to 0 means, Opening all protocols
        to_port          = 0
        protocol         = "-1"   # -1 all protocals
        cidr_blocks      = ["0.0.0.0/0"]
    }  
  
    tags = {
     Name = "allow_ssh"
     createdBy = "karthik"
    }
}

