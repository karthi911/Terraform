variable "image_id" {

    type             = string #optional
    default          = "ami-090252cbe067a9e58" # optinal 
    description      = "Rhel-9 AMI-ID" # Description is Optional

}

variable "instance_type" {

    type        =   list
    default     =  ["db", "backend", "Frontend",]
    description =  "Rhel-9 Instance ID" 
}

variable "instance_names" {
     type = list

     default = ["db", "backend", "Frontend",]
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



