
https://spacelift.io/blog/how-to-use-terraform-variables


Ansible variable Declaration Syntax:

USER=sivakumar --> declaring and assign value to variable
vars:
    user: sivakumar
    
Terraform Variable Syntax:


variable "<var-name>" {
    type = string/number/bool/list/map
    default = "<default-value>"
}




Priority wise variables in Terraform:

    ® Command Line (argument type)

 syntax:  

} terraform plan -var="<variable_argument= value/key"


Eg:

 terraform plan -var="instance_type=t3.micro"



 syntax:  
Let’s assign the variable a value using the terraform.tfvars file:
    • We will start by creating a file named terraform.tfvars. 
    • Next, we will assign the instance_type variable a value in this file.



    
    ® Env variables

  
Syntax:


} TF_VAR_<var-name>=value


Eg:

• Using environment variables to set a value.

TF_VAR_instance_type="t2.small" terraform plan




    ® Variable default value


   syntax:  

Variable "karthik_id" {

type = string
Default = "t3.micro"

}


What are Terraform variables?
Terraform variables are placeholders for values that you can use to make your configurations more dynamic and reusable. They let you define values that can be reused throughout your Terraform configuration, similar to variables in any programming language.

Terraform variables are used to accommodate different configurations without altering your code. You can easily change only the values of these variables to achieve different use cases. They make your configuration more dynamic and flexible, and they enhance the parametrization of your code. 

The importance of Terraform variables

Terraform variables are essential for building scalable, maintainable, and adaptable infrastructure configurations, ultimately contributing to efficient infrastructure management and deployment practices.

Terraform variables types
Terraform has several types of variables, each designed to handle different kinds of data. Below is the full list of Terraform variable types:

String — This fundamental type stores text values. Use strings for data that doesn’t require mathematical operations, such as usernames or tags.
Number — This type is used for numeric values that you might need to perform calculations on or use in numeric settings, such as scaling parameters, setting timeouts, and defining a number of instances to deploy.
Bool — Short for Boolean, this type is strictly for true or false values. They are essential for logic and conditional statements in configurations, such as enabling or disabling resource provisioning.
List — A list is a sequence of values of the same type. This type is ideal for scenarios where you need to manage a collection of similar items, like multiple configuration tags.
Map — Maps are collections of key-value pairs, each unique key mapping to a specific value. This type is useful, for example, when associating server names with their roles or configurations.
Tuple — This type is similar to lists but can contain a fixed number of elements, each potentially of a different type. Tuples are suitable when you need to group a specific set of values with varied types together, like a coordinate of mixed data types.
Object — Objects are used to define a structure with named attributes, each with its own type. They are very flexible, allowing the definition of complex relationships, like a configuration block that includes various attributes of different types.
Set — Sets are collections of unique values of the same type. They are useful when you need to ensure no duplicates, such as a list of unique user identifiers or configurations that must remain distinct.
We’ll discuss these in more detail with examples later in the article.

Local variables
Local variables are declared using the locals block. It is a group of key-value pairs that can be used in the configuration. The values can be hard-coded or be a reference to another variable or resource.

Local variables are accessible within the module/configuration where they are declared. Let us take an example of creating a configuration for an EC2 instance using local variables. Add this to a file named main.tf.

locals {
 ami  = "ami-0d26eb3972b7f8c96"
 type = "t2.micro"
 tags = {
   Name = "My Virtual Machine"
   Env  = "Dev"
 }
 subnet = "subnet-76a8163a"
 nic    = aws_network_interface.my_nic.id
}
 
resource "aws_instance" "myvm" {
 ami           = local.ami
 instance_type = local.type
 tags          = local.tags
 
 network_interface {
   network_interface_id = aws_network_interface.my_nic.id
   device_index         = 0
 }
}
 
resource "aws_network_interface" "my_nic" {
 description = "My NIC"
 subnet_id   = var.subnet
 
 tags = {
   Name = "My NIC"
 }
}
In this example, we have declared all the local variables in the locals block. The variables represent the AMI ID (ami), Instance type (type), Subnet Id (subnet), Network Interface (nic) and Tags (tags) to be assigned for the given EC2 instance.

In the aws_instance resource block, we used these variables to provide the appropriate values required for the given attribute. Notice how the local variables are being referenced using a local keyword (without ‘s’).

The usage of local variables is similar to data sources. However, they have a completely different purpose. Data sources fetch valid values from the cloud provider based on the query filters we provide. Whereas we can set our desired values in local variables — they are not dependent on the cloud providers.

It is indeed possible to assign a value from a data source to a local variable. Similar to how we have done it to create the nic local variable, it refers to the id argument in the aws_network_interface resource block.

As a best practice, try to keep the number of local variables to a minimum. Using many local variables can make the code hard to read.

If you want to know more about locals, see: Terraform Locals: What Are They, How to Use Them, Examples

Terraform input variables
Terraform input variables are used to pass certain values from outside of the configuration or module. They are used to assign dynamic values to resource attributes. The difference between local and input variables is that input variables allow you to pass values before the code execution.

Further, the main function of the input variables is to act as inputs to modules. Modules are self-contained pieces of code that perform certain predefined deployment tasks. Input variables declared within modules are used to accept values from the root directory.

Additionally, it is also possible to set certain attributes while declaring input variables, as below:

type — to identify the type of the variable being declared.
default — default value in case the value is not provided explicitly.
description — a description of the variable. This description is also used to generate documentation for the module.
validation — to define validation rules.
sensitive — a boolean value. If true, Terraform masks the variable’s value anywhere it displays the variable.
Terraform input variable types
Input variables support multiple data types.

They are broadly categorized as simple and complex. String, number, bool are simple data types, whereas list, map, tuple, object, and set are complex data types.

The following snippets provide examples for each of the types we listed.

String type
The string type input variables are used to accept values in the form of UNICODE characters. The value is usually wrapped by double quotes, as shown below.

variable "string_type" {
 description = "This is a variable of type string"
 type        = string
 default     = "Default string value for this variable"
}
The string type input variables also support a heredoc style format where the value being accepted is a longer string separated by new line characters. The start and end of the value is indicated by “EOF” (End Of File) characters. An example of the same is shown below.

variable "string_heredoc_type" {
 description = "This is a variable of type string"
 type        = string
 default     = <<EOF
hello, this is Sumeet.
Do visit my website!
EOF
}
Number type
The number type input variable enables us to define and accept numerical values as inputs for their infrastructure deployments. For example, these numeric values can help define the desired number of instances to be created in an auto-scaling group. The code below defines a number type input variable in any given Terraform config.

variable "number_type" {
 description = "This is a variable of type number"
 type        = number
 default     = 42
}
Boolean type
The boolean type input variable is used to define and accept true/false values as inputs for infrastructure deployments to incorporate logic and conditional statements into the Terraform configurations. Boolean input variables are particularly useful for enabling or disabling certain features or behaviors in infrastructure deployments.

An example of a boolean variable is below.

variable "boolean_type" {
 description = "This is a variable of type bool"
 type        = bool
 default     = true
}
Terraform list variable
Terraform list variables allow us to define and accept a collection of values as inputs for infrastructure deployments. A list is an ordered sequence of elements, and it can contain any data type, such as strings, numbers, or even other complex data structures. However, a single list cannot have multiple data types.

List type input variables are particularly useful in scenarios where we need to provide multiple values of the same type, such as a list of IP addresses, a set of ports, or a collection of resource names.

The example below is for an input variable of a type list that contains strings.

variable "list_type" {
 description = "This is a variable of type list"
 type        = list(string)
 default     = ["string1", "string2", "string3"]
}
Map type
The map type input variable enables us to define and accept a collection of key-value pairs as inputs for our infrastructure deployments. A map is a complex data structure that associates values with unique keys, similar to a dictionary or an object in other programming languages. For example, a map can be used to specify resource tags, environment-specific settings, or configuration parameters for different modules.

The example below shows how a map of string type values is defined in Terraform.

variable "map_type" {
 description = "This is a variable of type map"
 type        = map(string)
 default     = {
   key1 = "value1"
   key2 = "value2"
 }
}
Learn how to use the Terraform map variable.

Object type
An object represents a complex data structure that consists of multiple key-value pairs, where each key is associated with a specific data type for its corresponding value. The object type input variable allows us to define and accept a structured set of properties or attributes as inputs for our infrastructure deployments. For example, an object is used to define a set of parameters for a server configuration.

The variable below demonstrates how an object type input variable is defined with multi-typed properties.

variable "object_type" {
 description = "This is a variable of type object"
 type        = object({
   name    = string
   age     = number
   enabled = bool
 })
 default = {
   name    = "John Doe"
   age     = 30
   enabled = true
 }
}
Tuple type
A tuple is a fixed-length collection that can contain values of different data types. The key differences between tuples and lists are:

Tuples have a fixed length, as against lists.
With tuples, it is possible to include values with different primitive types. Meanwhile, lists dictate the type of elements included in them.
Values included in tuples are ordered. Due to their dynamic sizes, it is possible to resize and reorder the values in lists.
An example of a tuple type input variable:

variable "tuple_type" {
 description = "This is a variable of type tuple"
 type        = tuple([string, number, bool])
 default     = ["item1", 42, true]
}
Set type
A set is an unordered collection of distinct values, meaning each element appears only once within the set. As against lists, sets enforce uniqueness – each element can appear only once within the set. Sets support various inbuilt operations such as union, intersection, and difference, which are used to combine or compare sets.

An example of a set type input variable is below.

variable "set_example" {
 description = "This is a variable of type set"
 type        = set(string)
 default     = ["item1", "item2", "item3"]
}
Map of objects
One of the widely used complex input variable types is map(object). It is a data type that represents a map where each key is associated with an object value.

It allows us to create a collection of key-value pairs, where the values are objects with defined attributes and their respective values. When using map(object), we define the structure of the object values by specifying the attributes and their corresponding types within the object type definition. Each object within the map can have its own set of attributes, providing flexibility to represent diverse sets of data.

An example of the same is given below, where the map of objects represents attribute values used for the creation of multiple subnets.

variable "map_of_objects" {
  description = "This is a variable of type Map of objects"
  type = map(object({
    name = string,
    cidr = string
  }))
  default = {
    "subnet_a" = {
    name = "Subnet A",
    cidr = "10.10.1.0/24"
    },
  "subnet_b" = {
    name = "Subnet B",
    cidr = "10.10.2.0/24"
    },
  "subnet_c" = {
    name = "Subnet C",
    cidr = "10.10.3.0/24"
    }
  }
}
List of objects
This type of variable is similar to the Map of objects, except that the objects are not referred to by any “key”. The example used for the Map of objects can also be represented in the form of a list of objects, as shown below.

The list(object) is an ordered list of objects where each object is referred to using the index. On the other hand, map(object) is an unordered set, and each object is referred to using the key value.

variable "list_of_objects" {
  description = "This is a variable of type List of objects"
  type = list(object({
    name = string,
    cidr = string
  }))
  default = [
    {
      name = "Subnet A",
      cidr = "10.10.1.0/24"
    },
    {
      name = "Subnet B",
      cidr = "10.10.2.0/24"
    },
    {
      name = "Subnet C",
      cidr = "10.10.3.0/24"
    }
  ]
}


