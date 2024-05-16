resource "aws_route53_record" "Expense" {
  count = length(var.instance_names)
  zone_id = var.zone_id                                                       // below line we given interpolation nothing but combining text and variable at same line.        
  name    =  var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
  ### count and count.index will not work in locals.
  #name   = local.record_name 
  type    = "A"
  ttl     = 1
 records = var.instance_names[count.index] == "frontend" ? [aws_instance.Expense[count.index].public_ip] : [aws_instance.Expense[count.index].private_ip]
  
    ### count and count.index will not work in locals.
  # records = local.record_value
  
  ## if records already exists
  allow_overwrite = true

}