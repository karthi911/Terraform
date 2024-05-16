resource "aws_instance" "db" {

    ami = var.image_id
    
   # instance_type = var.instance_name == "DB" ? "t3.small" : "t3.micro" // Condition Expression for Instance Type.
 
    instance_type = var.instance_name != "backend" ? "t3.micro" : "t3.small"


 # Left Side things are called as arguments, Right sidef are values.
   # tags = var.tags
}
