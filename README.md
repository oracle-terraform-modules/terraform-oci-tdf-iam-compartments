# Oracle Cloud Infrastructure (OCI) Terraform IAM Compartments Module

## Introduction


This module assist in provisioning OCI Compartments.
  

## Solution

This module assist in provisioning OCI Compartments.

The module covers the following usecases:

* Creating one or multiple compartments.
* Creating up to 6(OCI limit) hierarchical(one to another) compartments
  * ![\label{mylabel}](docs/compartment_levels.PNG) 

Multiple combinations between the usescases above are possible/supported.

### Prerequisites
This module does not create any dependencies or prerequisites (these must be created prior to using this module):

* Mandatory(needs to exist before creating the IAM resources)
  * Required IAM construct to allow for the creation of resources

### Module inputs

#### `providers`

* This module supports custom provider. This is provided as when creating IAM resources you need to do this against the tenancy home region which might be different then the region used by the rest of your automation project. In the examples sections we're querrying the home region by using the default provider and, in this way, calculating the home region provider.

You'll be managing those providers in the tf automation projects where you reference this module.

Example:

```
provider "oci" {
  tenancy_ocid     = "${var.tenancy_id}"
  user_ocid        = "${var.user_id}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region           = "${var.region}"
}

provider "oci" {
  alias            = "home"
  tenancy_ocid     = "${var.tenancy_id}"
  user_ocid        = "${var.user_id}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region           = [for i in data.oci_identity_region_subscriptions.this.region_subscriptions : i.region_name if i.is_home_region == true][0]
}

data "oci_identity_region_subscriptions" "this" {
  tenancy_id = var.tenancy_id
}

```

* Bellow you can find the IAM attributes provided in the the `terraform.tfvars` file:

```
### TENANCY DETAILS

# Get this from the bottom of the OCI screen (after logging in, after Tenancy ID: heading)
tenancy_id="<tenancy OCID"
# Get this from OCI > Identity > Users (for your user account)
user_id="<user OCID>"

# the fingerprint can be gathered from your user account (OCI > Identity > Users > click your username > API Keys fingerprint (select it, copy it and paste it below))
fingerprint="<PEM key fingerprint>"
# this is the full path on your local system to the private key used for the API key pair
private_key_path="<path to the private key that matches the fingerprint above>"

# region (us-phoenix-1, ca-toronto-1, etc)
region="<your home region>"

```


#### `compartments`

* compartments input variable represents a map containing a collection of compartments. Each compartment object specifies the  attributes for a compartment, including the parrent compartment.


  * The automation creates the following resources with the following attributes:
    * `oci_identity_compartment.compartments`:

| Attribute | Data Type | Required | Default Value | Valid Values | Description |
|---|---|---|---|---|---|
| provider | string | yes | "oci.oci_home"| string containing the name of the provider as defined by the automation that consumes this module | See the examples section in order to understand how to set the provider|
| count | number | yes | 0 | the number of resources to be created | the number of resources to be created |
| name | string | yes | "OCI-TF-Group" | string of the display name | Resource name |
| compartment\_id | string | yes | none | string of the parent compartment OCID | This is the OCID of the parent compartment |
| description | string | no | N/A (no default) | The provided description |
| define\_tags | map(string) | no | N/A (no default) | The defined tags.
| freeform\_tags| map(string) | no | N/A (no default) | The freeform\_tags.



Example:

```
# Compartments config Variable

compartments_config = {
  default_compartment_id = "<root/master_compartment_ocid>"
  default_defined_tags   = {}
  default_freeform_tags  = null
  compartments = {
    compartment_1 = {
      description    = "Test Compartment 1"
      compartment_id = "<specific_compartment_ocid>"
      defined_tags   = null
      freeform_tags  = null
    }
    compartment_2 = {
      description    = "Test Compartment 2"
      compartment_id = "<specific_compartment_ocid>"
      defined_tags   = {}
      freeform_tags  = {}
    }
  }
}

```
The above example will create :
            * 2 compartments

### Outputs

This module is returning 1 map of objects:
* `compartments_config` - containes the details about each provisioned Compartment and the tenancy home region

## Getting Started

Several fully-functional examples have been provided in the `examples` directory.  

The scenarios covered in the examples section are:
* Creating a collection of Dynamic Groups, each Dynamic Group containing a list of instances.

## Accessing the Solution

This is a core service module that is foundational to many other resources in OCI, so there is really nothing to directly access.

## Summary

This serves as a foundational component in an OCI environment, providing the ability to provision File Storage Service instances.

## Notes/Issues


## URLs

* OCI IAM Dynamic Groups documentation: 
  * https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingdynamicgroups.htm

## Contributing

This project is open source. Oracle appreciates any contributions that are made by the open source community.

## Versions

This module has been developed and tested by running terraform on macOS Mojave Version 10.14.5

```
user-mac$ terraform --version
Terraform v0.12.3
+ provider.oci v3.31.0
```

## License

Copyright (c) 2020, Oracle and/or its affiliates.

Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

See [LICENSE](LICENSE) for more details.
