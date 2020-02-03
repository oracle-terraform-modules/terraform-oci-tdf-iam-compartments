# OCI IAM Compartments Module Example

## Introduction

This example shows how to provision one or multiple Compartments.

The following resources are created in this example:

* zero, one or multiple compartments

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
module "oci_iam_compartments" {

  source = "../../"

  providers = {
    oci.oci_home = "oci.home"
  }

  compartments_config = var.compartments_config
}

```

Edit your `iam.auto.tfvars` file:

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

Then apply the example using the following commands:

```
$ terraform init
$ terraform plan
$ terraform apply
```
