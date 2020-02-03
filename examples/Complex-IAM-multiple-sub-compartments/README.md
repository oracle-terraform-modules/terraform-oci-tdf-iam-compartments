# OCI IAM Compartments Module Example

## Introduction

This example shows how to provision up to 6(OCI limit) hierarchical(one to another) Compartments.

![\label{mylabel}](docs/compartment_levels.PNG) 


## Using this example
* Prepare one variable file named `terraform.tfvars` with the required IAM information. The contents of `terraform.tfvars` should look something like the following (or copy and re-use the contents of `terraform.tfvars.template`:

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
region="<your region>"
```

* Set up the provider:

`providers.tf`:

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
`main.tf`:

```
...
// Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.


module "compartment_1" {

  source = "../../"

  providers = {
    oci.oci_home = "oci"
  }

  compartments_config = {
    default_compartment_id = var.sub_compartments_config.master_comp_parent_compartment_id
    default_defined_tags   = var.sub_compartments_config.default_defined_tags
    default_freeform_tags  = var.sub_compartments_config.default_freeform_tags
    compartments = {
      compartment_1 = {
        description    = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[0]].description
        compartment_id = var.sub_compartments_config.master_comp_parent_compartment_id
        defined_tags   = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[0]].defined_tags
        freeform_tags  = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[0]].freeform_tags
      }
    }
  }
}

module "compartment_2" {

  source = "../../"

  providers = {
    oci.oci_home = "oci"
  }
  compartments_config = {
    default_compartment_id = module.compartment_1.compartments_config[keys(var.sub_compartments_config.compartments)[0]].id
    default_defined_tags   = var.sub_compartments_config.default_defined_tags
    default_freeform_tags  = var.sub_compartments_config.default_freeform_tags
    compartments = {
      compartment_2 = {
        description    = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[1]].description
        compartment_id = module.compartment_1.compartments_config[keys(var.sub_compartments_config.compartments)[0]].id
        defined_tags   = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[1]].defined_tags
        freeform_tags  = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[1]].freeform_tags
      }
    }
  }
}


module "compartment_3" {

  source = "../../"

  providers = {
    oci.oci_home = "oci"
  }

  compartments_config = {
    default_compartment_id = module.compartment_2.compartments_config[keys(var.sub_compartments_config.compartments)[1]].id
    default_defined_tags   = var.sub_compartments_config.default_defined_tags
    default_freeform_tags  = var.sub_compartments_config.default_freeform_tags
    compartments = {
      compartment_3 = {
        description    = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[2]].description
        compartment_id = module.compartment_2.compartments_config[keys(var.sub_compartments_config.compartments)[1]].id
        defined_tags   = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[2]].defined_tags
        freeform_tags  = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[2]].freeform_tags
      }
    }
  }
}

module "compartment_4" {

  source = "../../"

  providers = {
    oci.oci_home = "oci"
  }

  compartments_config = {
    default_compartment_id = module.compartment_3.compartments_config[keys(var.sub_compartments_config.compartments)[2]].id
    default_defined_tags   = var.sub_compartments_config.default_defined_tags
    default_freeform_tags  = var.sub_compartments_config.default_freeform_tags
    compartments = {
      compartment_4 = {
        description    = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[3]].description
        compartment_id = module.compartment_3.compartments_config[keys(var.sub_compartments_config.compartments)[2]].id
        defined_tags   = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[3]].defined_tags
        freeform_tags  = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[3]].freeform_tags
      }
    }
  }
}


module "compartment_5" {

  source = "../../"

  providers = {
    oci.oci_home = "oci"
  }

  compartments_config = {
    default_compartment_id = module.compartment_4.compartments_config[keys(var.sub_compartments_config.compartments)[3]].id
    default_defined_tags   = var.sub_compartments_config.default_defined_tags
    default_freeform_tags  = var.sub_compartments_config.default_freeform_tags
    compartments = {
      compartment_5 = {
        description    = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[4]].description
        compartment_id = module.compartment_4.compartments_config[keys(var.sub_compartments_config.compartments)[3]].id
        defined_tags   = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[4]].defined_tags
        freeform_tags  = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[4]].freeform_tags
      }
    }
  }
}

module "compartment_6" {

  source = "../../"

  providers = {
    oci.oci_home = "oci"
  }

  compartments_config = {
    default_compartment_id = module.compartment_5.compartments_config[keys(var.sub_compartments_config.compartments)[4]].id
    default_defined_tags   = var.sub_compartments_config.default_defined_tags
    default_freeform_tags  = var.sub_compartments_config.default_freeform_tags
    compartments = {
      compartment_6 = {
        description    = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[5]].description
        compartment_id = module.compartment_5.compartments_config[keys(var.sub_compartments_config.compartments)[4]].id
        defined_tags   = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[5]].defined_tags
        freeform_tags  = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[5]].freeform_tags
      }
    }
  }
}

...
```

Edit your `iam.auto.tfvars` file:

```
sub_compartments_config = {
  master_comp_parent_compartment_id = "<master-compartment-id>"
  default_defined_tags              = {}
  default_freeform_tags             = null
  compartments = {
    compartment_1 = {
      description   = "Test Compartment 1"
      defined_tags  = null
      freeform_tags = null
    }
    compartment_2 = {
      description   = "Test Compartment 2"
      defined_tags  = {}
      freeform_tags = {}
    }
    compartment_3 = {
      description   = "Test Compartment 3"
      defined_tags  = {}
      freeform_tags = {}
    }
    compartment_4 = {
      description   = "Test Compartment 4"
      defined_tags  = {}
      freeform_tags = {}
    }
    compartment_5 = {
      description   = "Test Compartment 5"
      defined_tags  = {}
      freeform_tags = {}
    }
    compartment_6 = {
      description   = "Test Compartment 6"
      defined_tags  = {}
      freeform_tags = {}
    }
  }
}
```

Then apply the example using the following commands:

```
$ terraform init
$ terraform plan
$ terraform apply
```
