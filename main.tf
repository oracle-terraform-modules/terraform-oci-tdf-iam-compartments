# Copyright (c) 2020, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


locals {

  #################
  # Compartments
  #################
  # default values

  default_compartment = {
    compartment_id = null
    description    = "OCI Compartment created with the OCI Core IAM Compartments Module"
    defined_tags   = {}
    freeform_tags  = { "Department" = "Security" }
  }
}


resource "oci_identity_compartment" "compartments" {
  provider = "oci.oci_home"
  for_each = var.compartments_config != null ? (var.compartments_config.compartments != null ? var.compartments_config.compartments : {}) : {}

  #Required
  compartment_id = each.value.compartment_id != null ? each.value.compartment_id : (var.compartments_config.default_compartment_id != null ? var.compartments_config.default_compartment_id : local.default_compartment.compartment_id)
  description    = each.value.description != null ? each.value.description : local.default_compartment.description
  name           = each.key

  #Optional
  defined_tags  = each.value.defined_tags != null ? each.value.defined_tags : (var.compartments_config.default_defined_tags != null ? var.compartments_config.default_defined_tags : local.default_compartment.defined_tags)
  freeform_tags = each.value.freeform_tags != null ? each.value.freeform_tags : (var.compartments_config.default_freeform_tags != null ? var.compartments_config.default_freeform_tags : local.default_compartment.freeform_tags)
}




