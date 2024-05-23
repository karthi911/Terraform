

## Ec2 variables

variable "instance_names" {
    type = map
    default = {
             
     db = "t3.small"
     backend = "t3.micro"
    frontend = "t3.micro"
            

    }
}





## Tags variables

variable "common_tags" {
     
     default = {
          project = "Expense"
          Environment = "DEV"
           Terraform  = "true"
          
     }
}




variable  "sgt" {
     default = {
       
       name   = "allow_ssh"
       createdBy = "karthik"
    }

}

## Route53 variables ###

variable "domain_name" {
    default = "awsdevops78s.online"
}

variable "zone_id" {
    default = "Z01120081GUWAUA4ZXJ5D"
}
