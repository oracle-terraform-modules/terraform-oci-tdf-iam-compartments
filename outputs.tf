# Copyright (c) 2020, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


#########################
## Compartments
#########################
output "compartments_config" {
  description = "The returned resource attributes for the Compartments."
  value = {
    compartments = {
      for l1 in oci_identity_compartment.l1_compartments : l1.name => {
        name                    = l1.name,
        description             = l1.description,
        compartment_id          = l1.compartment_id,
        parent_compartment_name = data.oci_identity_compartments.l1_comp_parent[l1.name].compartments[0].name
        defined_tags            = l1.defined_tags,
        freeform_tags           = l1.freeform_tags,
        id                      = l1.id,
        is_accessible           = l1.is_accessible,
        state                   = l1.state,
        time_created            = l1.time_created
        subcompartments = {
          for l2 in oci_identity_compartment.l2_compartments : l2.name => {
            name                    = l2.name,
            description             = l2.description,
            compartment_id          = l2.compartment_id,
            parent_compartment_name = l1.name,
            defined_tags            = l2.defined_tags,
            freeform_tags           = l2.freeform_tags,
            id                      = l2.id,
            is_accessible           = l2.is_accessible,
            state                   = l2.state,
            time_created            = l2.time_created,
            subcompartments = {
              for l3 in oci_identity_compartment.l3_compartments : l3.name => {
                name                    = l3.name,
                description             = l3.description,
                compartment_id          = l3.compartment_id,
                parent_compartment_name = l2.name,
                defined_tags            = l3.defined_tags,
                freeform_tags           = l3.freeform_tags,
                id                      = l3.id,
                is_accessible           = l3.is_accessible,
                state                   = l3.state,
                time_created            = l3.time_created,
                subcompartments = {
                  for l4 in oci_identity_compartment.l4_compartments : l4.name => {
                    name                    = l4.name,
                    description             = l4.description,
                    compartment_id          = l4.compartment_id,
                    parent_compartment_name = l3.name,
                    defined_tags            = l4.defined_tags,
                    freeform_tags           = l4.freeform_tags,
                    id                      = l4.id,
                    is_accessible           = l4.is_accessible,
                    state                   = l4.state,
                    time_created            = l4.time_created,
                    subcompartments = {
                      for l5 in oci_identity_compartment.l5_compartments : l5.name => {
                        name                    = l5.name,
                        description             = l5.description,
                        compartment_id          = l5.compartment_id,
                        parent_compartment_name = l4.name,
                        defined_tags            = l5.defined_tags,
                        freeform_tags           = l5.freeform_tags,
                        id                      = l5.id,
                        is_accessible           = l5.is_accessible,
                        state                   = l5.state,
                        time_created            = l5.time_created,
                        subcompartments = {
                          for l6 in oci_identity_compartment.l6_compartments : l6.name => {
                            name                    = l6.name,
                            description             = l6.description,
                            compartment_id          = l6.compartment_id,
                            parent_compartment_name = l5.name,
                            defined_tags            = l6.defined_tags,
                            freeform_tags           = l6.freeform_tags,
                            id                      = l6.id,
                            is_accessible           = l6.is_accessible,
                            state                   = l6.state,
                            time_created            = l6.time_created
                          } if l6.compartment_id == l5.id
                        }
                      } if l5.compartment_id == l4.id
                    }
                  } if l4.compartment_id == l3.id
                }
              } if l3.compartment_id == l2.id
            }
          } if l2.compartment_id == l1.id
        }
      }
    }
  }.compartments
}

output "compartments_config_flat" {
  description = "The returned resource attributes for the Compartments."
  value = {
    compartments = merge({
      for l1 in oci_identity_compartment.l1_compartments : l1.name => {
        name           = l1.name,
        description    = l1.description,
        compartment_id = l1.compartment_id,
        defined_tags   = l1.defined_tags,
        freeform_tags  = l1.freeform_tags,
        id             = l1.id,
        is_accessible  = l1.is_accessible,
        state          = l1.state,
        time_created   = l1.time_created
      }
      },
      {
        for l2 in oci_identity_compartment.l2_compartments : l2.name => {
          name           = l2.name,
          description    = l2.description,
          compartment_id = l2.compartment_id,
          defined_tags   = l2.defined_tags,
          freeform_tags  = l2.freeform_tags,
          id             = l2.id,
          is_accessible  = l2.is_accessible,
          state          = l2.state,
          time_created   = l2.time_created,
        }
      },
      {
        for l3 in oci_identity_compartment.l3_compartments : l3.name => {
          name           = l3.name,
          description    = l3.description,
          compartment_id = l3.compartment_id,
          defined_tags   = l3.defined_tags,
          freeform_tags  = l3.freeform_tags,
          id             = l3.id,
          is_accessible  = l3.is_accessible,
          state          = l3.state,
          time_created   = l3.time_created,
        }
      },
      {
        for l4 in oci_identity_compartment.l4_compartments : l4.name => {
          name           = l4.name,
          description    = l4.description,
          compartment_id = l4.compartment_id,
          defined_tags   = l4.defined_tags,
          freeform_tags  = l4.freeform_tags,
          id             = l4.id,
          is_accessible  = l4.is_accessible,
          state          = l4.state,
          time_created   = l4.time_created,
        }
      },
      {
        for l5 in oci_identity_compartment.l5_compartments : l5.name => {
          name           = l5.name,
          description    = l5.description,
          compartment_id = l5.compartment_id,
          defined_tags   = l5.defined_tags,
          freeform_tags  = l5.freeform_tags,
          id             = l5.id,
          is_accessible  = l5.is_accessible,
          state          = l5.state,
          time_created   = l5.time_created,
        }
      },
      {
        for l6 in oci_identity_compartment.l6_compartments : l6.name => {
          name           = l6.name,
          description    = l6.description,
          compartment_id = l6.compartment_id,
          defined_tags   = l6.defined_tags,
          freeform_tags  = l6.freeform_tags,
          id             = l6.id,
          is_accessible  = l6.is_accessible,
          state          = l6.state,
          time_created   = l6.time_created,
        }
      }
    )
  }.compartments
}

