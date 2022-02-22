# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

data "oci_identity_compartments" "l1_comp_parent" {
  provider = oci.oci_home
  for_each = var.compartments_config != null ? (var.compartments_config.compartments != null ? var.compartments_config.compartments : {}) : {}

  #Required
  compartment_id = each.value.compartment_id != null ? each.value.compartment_id : (var.compartments_config.default_compartment_id != null ? var.compartments_config.default_compartment_id : local.default_compartment.compartment_id)
}