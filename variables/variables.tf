variable "image_id" {

    type             = string #optional
    default          = "ami-090252cbe067a9e58" # optinal 
    description      = "Rhel-9 AMI-ID" # Description is Optional

}

variable "instance_type" {

    type        =   string
    default     =  "t3.micro"
    description =  "Rhel-9 Instance ID" 
}

variable "tags" {
     
     default = {
          project = "Expense"
          Environment = "DEV"
           Module = "DB"
           name   = "DB"
     }
}
variable "sg_name" {

type  = string
default = "allow_ssh"

}
variable "sg_description" {
    type = string
    default = "Allowing the port no 22"

}
variable "ssh_port" {
    type = number 
    default = 22

}

variable "Protocol" {
    
    type = string
    default = "tcp"

}

variable "allowed_cidr" {

    type = list(string)
    default = ["0.0.0.0/0"]
}
variable  "sgt" {
     default = {
       
       name   = "allow_ssh"
       createdBy = "karthik"
    }

}


