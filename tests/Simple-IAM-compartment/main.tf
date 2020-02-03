# Copyright (c) 2020, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


locals {
  compartments_config = {
    default_compartment_id = var.compartment_id
    default_defined_tags   = {}
    default_freeform_tags  = null
    compartments = {
      test_compartment = {
        description    = "Test Compartment 1"
        compartment_id = null
        defined_tags   = null
        freeform_tags  = null
      }
    }
  }
}
module "oci_iam_compartments" {

  source = "../../"

  providers = {
    oci.oci_home = "oci.home"
  }

  compartments_config = local.compartments_config
}
