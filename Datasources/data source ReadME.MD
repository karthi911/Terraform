
## Data Source Summary :


data sources
------------------

going to console, searching it and then using it...

querying and filtering AWS


terraform have AWS credentials..

terraform can query and fetch the AMI_ID automatically

few teams created infra manually. our team is using terraform

I want existing default vpc_id...



## Data Sources


Data sources allow Terraform to use information defined outside of Terraform, defined by another separate Terraform configuration, or modified by functions.

Hands-on: Try the Query Data Sources tutorial.

Each provider may offer data sources alongside its set of resource types.

Using Data Sources
A data source is accessed via a special kind of resource known as a data resource, declared using a data block:

data "aws_ami" "example" {
  most_recent = true
 
  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}

A data block requests that Terraform read from a given data source ("aws_ami") and export the result under the given local name ("example"). The name is used to refer to this resource from elsewhere in the same Terraform module, but has no significance outside of the scope of a module.

The data source and name together serve as an identifier for a given resource and so must be unique within a module.

Within the block body (between { and }) are query constraints defined by the data source. Most arguments in this section depend on the data source, and indeed in this example most_recent, owners and tags are all arguments defined specifically for the aws_ami data source.

When distinguishing from data resources, the primary kind of resource (as declared by a resource block) is known as a managed resource. Both kinds of resources take arguments and export attributes for use in configuration, but while managed resources cause Terraform to create, update, and delete infrastructure objects, data resources cause Terraform only to read objects. For brevity, managed resources are often referred to just as "resources" when the meaning is clear from context.


## Data Source Arguments

Each data resource is associated with a single data source, which determines the kind of object (or objects) it reads and what query constraint arguments are available.

Each data source in turn belongs to a provider, which is a plugin for Terraform that offers a collection of resource types and data sources that most often belong to a single cloud or on-premises infrastructure platform.

Most of the items within the body of a data block are defined by and specific to the selected data source, and these arguments can make full use of expressions and other dynamic Terraform language features.

However, there are some "meta-arguments" that are defined by Terraform itself and apply across all data sources. These arguments often have additional restrictions on what language features can be used with them, and are described in more detail in the following sections.


Lifecycle Customizations
Data resources do not have any customization settings available for their lifecycle. However, the lifecycle block is reserved for future versions.

Example
A data source configuration looks like the following:

# Find the latest available AMI that is tagged with Component = web
data "aws_ami" "web" {
  filter {
    name   = "state"
    values = ["available"]
  }
 
  filter {
    name   = "tag:Component"
    values = ["web"]
  }
 
  most_recent = true
}

## Description

The data block creates a data instance of the given type (first block label) and name (second block label). The combination of the type and name must be unique.

Within the block (the { }) is configuration for the data instance. The configuration is dependent on the type; as with resources, each provider on the Terraform Registry has its own documentation for configuring and using the data types it provides.

Each data instance will export one or more attributes, which can be used in other resources as reference expressions of the form data.<TYPE>.<NAME>.<ATTRIBUTE>. For example:

resource "aws_instance" "web" {
  ami           = data.aws_ami.web.id
  instance_type = "t1.micro"
}

https://developer.hashicorp.com/terraform/language/data-sources
