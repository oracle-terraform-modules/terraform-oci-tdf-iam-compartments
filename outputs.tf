# Copyright (c) 2020, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


#########################
## Compartments
#########################
output "compartments_config" {
  description = "The returned resource attributes for the Compartments."
  value = {
    for x in oci_identity_compartment.compartments : x.name => { name = x.name,
      description                                                     = x.description,
      compartment_id                                                  = x.compartment_id,
      defined_tags                                                    = x.defined_tags,
      freeform_tags                                                   = x.freeform_tags,
      id                                                              = x.id,
      is_accessible                                                   = x.is_accessible,
      state                                                           = x.state,
      time_created                                                    = x.time_created
    }
  }
}

