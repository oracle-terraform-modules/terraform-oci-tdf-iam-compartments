# Copyright (c) 2020, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


# tenancy details
variable "tenancy_id" {}
variable "user_id" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}


# Hierarchical Compartments Config Variable - max depth = 6
variable "sub_compartments_config" {
  type = object({
    master_comp_parent_compartment_id = string,
    default_defined_tags              = map(string),
    default_freeform_tags             = map(string),
    compartments = map(object({
      description   = string,
      defined_tags  = map(string),
      freeform_tags = map(string)
    }))
  })
  description = "Parameters to provision zero, one or multiple sub-compartments"
}


