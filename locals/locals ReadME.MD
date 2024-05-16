## Summary of Local Concept :


** Local Concept in Terraform **


## LOCALS: 

1) locals and variables are same, referring key value pairs

2) locals can hold expressions and use it wherever you want. You can use variables inside locals. but you can't use other variables/locals inside variables



Hands-on: Try the Simplify Terraform Configuration with Locals tutorial.

A local value assigns a name to an expression, so you can use the name multiple times within a module instead of repeating the expression.

If you're familiar with traditional programming languages, it can be useful to compare Terraform modules to function definitions:

Input variables are like function arguments.
Output values are like function return values.
Local values are like a function's temporary local variables.

Note: For brevity, local values are often referred to as just "locals" when the meaning is clear from context.

Declaring a Local Value
A set of related local values can be declared together in a single locals block:

# syntax: 

locals {
  service_name = "forum"
  owner        = "Community Team"
}

The expressions in local values are not limited to literal constants; they can also reference other values in the module in order to transform or combine them, including variables, resource attributes, or other local values:

# code 

locals {
  # Ids for multiple sets of EC2 instances, merged together
  instance_ids = concat(aws_instance.blue.*.id, aws_instance.green.*.id) ## using the funtions as Expression in locals.

}
 
locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }
}

Using Local Values
Once a local value is declared, you can reference it in expressions as local.<NAME>.
Note: Local values are created by a locals block (plural), but you reference them as attributes on an object named local (singular). Make sure to leave off the "s" when referencing a local value!

resource "aws_instance" "example" {
  # ...
 
  tags = local.common_tags
}

A local value can only be accessed in expressions within the module where it was declared.