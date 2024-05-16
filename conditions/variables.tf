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
variable "instance_name" {

    default = "DB"
}