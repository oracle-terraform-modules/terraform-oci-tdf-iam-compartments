# Copyright (c) 2020, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


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