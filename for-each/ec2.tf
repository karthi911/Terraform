resource "aws_instance" "Expense" {
    for_each = var.instance_names # each.key and each.value
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = ["sg-00582685c0b1beb17"]   # replace with your SG ID
    instance_type = each.value
    tags = merge(
          var.common_tags,var.sgt,
        {
        module = each.key   
        Name = each.key
    }
    )
}