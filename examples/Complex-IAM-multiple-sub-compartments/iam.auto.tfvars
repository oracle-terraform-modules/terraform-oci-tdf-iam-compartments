# Copyright (c) 2020, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


# Compartments config Variable

compartments_config = {
  default_compartment_id = "ocid1.tenancy.oc1..aaaaaaaaxzpxbcag7zgamh2erlggqro3y63tvm2rbkkjz4z2zskvagupiz7a"
  default_defined_tags   = {}
  default_freeform_tags  = null
  compartments = {
    l1_c1 = {
      description    = "Test Compartment l1_c1"
      compartment_id = "ocid1.tenancy.oc1..aaaaaaaaxzpxbcag7zgamh2erlggqro3y63tvm2rbkkjz4z2zskvagupiz7a"
      defined_tags   = null
      freeform_tags  = null
      enable_delete  = true
      sub_compartments = {
        l1_c1_l2_c1 = {
          description   = "Test Compartment l1_c1_l2_c1"
          defined_tags  = null
          freeform_tags = null
          enable_delete = true
          sub_compartments = {
            l1_c1_l2_c1_l3_c1 = {
              description   = "Test compartment l1_c1_l2_c1_l3_c1"
              defined_tags  = null
              freeform_tags = null
              enable_delete = true
              sub_compartments = {
                l1_c1_l2_c1_l3_c1_l4_c1 = {
                  description   = "Test compartment l1_c1_l2_c1_l3_c1_l4_c1"
                  defined_tags  = null
                  freeform_tags = null
                  enable_delete = true
                  sub_compartments = {
                    l1_c1_l2_c1_l3_c1_l4_c1_l5_c1 = {
                      description   = "Test compartment l1_c1_l2_c1_l3_c1_l4_c1_l5_c1"
                      defined_tags  = null
                      freeform_tags = null
                      enable_delete = true
                      sub_compartments = {
                        l1_c1_l2_c1_l3_c1_l4_c1_l5_c1_l6_c1 = {
                          description   = "Test compartment l1_c1_l2_c1_l3_c1_l4_c1_l5_c1_l6_c1"
                          defined_tags  = null
                          freeform_tags = null
                          enable_delete = true
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    l1_c2 = {
      description    = "Test Compartment l2_c1"
      compartment_id = "ocid1.tenancy.oc1..aaaaaaaaxzpxbcag7zgamh2erlggqro3y63tvm2rbkkjz4z2zskvagupiz7a"
      defined_tags   = {}
      freeform_tags  = {}
      enable_delete  = true
      sub_compartments = {
        l1_c2_l2_c1 = {
          description   = "Test Compartment l1_c2_l2_c1"
          defined_tags  = null
          freeform_tags = null
          enable_delete = true
          sub_compartments = {
            l1_c2_l2_c1_l3_c1 = {
              description   = "Test compartment l1_c2_l2_c1_l3_c1"
              defined_tags  = null
              freeform_tags = null
              enable_delete = true
              sub_compartments = {
                l1_c2_l2_c1_l3_c1_l4_c1 = {
                  description   = "Test compartment l1_c2_l2_c1_l3_c1_l4_c1"
                  defined_tags  = null
                  freeform_tags = null
                  enable_delete = true
                  sub_compartments = {
                    l1_c2_l2_c1_l3_c1_l4_c1_l5_c1 = {
                      description   = "Test compartment l1_c2_l2_c1_l3_c1_l4_c1_l5_c1"
                      defined_tags  = null
                      freeform_tags = null
                      enable_delete = true
                      sub_compartments = {
                        l1_c2_l2_c1_l3_c1_l4_c1_l5_c1_l6_c1 = {
                          description   = "Test compartment l1_c2_l2_c1_l3_c1_l4_c1_l5_c1_l6_c1"
                          defined_tags  = null
                          freeform_tags = null
                          enable_delete = true
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

