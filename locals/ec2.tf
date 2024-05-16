resource "aws_instance" "locals" {

    ami = local.ami_id
    vpc_security_group_ids = [local.Sg_id]
    instance_type = local.instance_type
    tags = local.tags

}


