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

  l2_compartments_list = var.compartments_config.compartments != null ? (length(var.compartments_config.compartments) != 0 ? flatten({
    for k, v in(var.compartments_config.compartments != null ? var.compartments_config.compartments : {}) : "sub_compartments" => {
      for k1, v1 in(v["sub_compartments"] != null ? v["sub_compartments"] : {}) : k1 => {
        description             = v1.description
        name                    = k1
        parent_compartment_name = k
        defined_tags            = v1.defined_tags
        freeform_tags           = v1.freeform_tags
        enable_delete           = v1.enable_delete
        sub_compartments        = v1.sub_compartments
      }
    }...
  }["sub_compartments"]) : []) : []

  l2_compartments = {
    for v3 in flatten(([for v1 in [for k, v in local.l2_compartments_list : v] : [for v2 in v1 : v2]])) : v3.name => {
      name                    = v3.name
      description             = v3.description
      parent_compartment_name = v3.parent_compartment_name
      compartment_id          = oci_identity_compartment.l1_compartments[v3.parent_compartment_name].id
      defined_tags            = v3.defined_tags
      freeform_tags           = v3.freeform_tags
      enable_delete           = v3.enable_delete
      sub_compartments        = v3.sub_compartments
    }
  }

  l3_compartments_list = local.l2_compartments != null ? (length(local.l2_compartments) != 0 ? flatten({
    for k, v in(local.l2_compartments != null ? local.l2_compartments : {}) : "sub_compartments" => {
      for k1, v1 in(v["sub_compartments"] != null ? v["sub_compartments"] : {}) : k1 => {
        description             = v1.description
        name                    = k1
        parent_compartment_name = k
        defined_tags            = v1.defined_tags
        freeform_tags           = v1.freeform_tags
        enable_delete           = v1.enable_delete
        sub_compartments        = v1.sub_compartments
      }
    }...
  }["sub_compartments"]) : []) : []

  l3_compartments = {
    for v3 in flatten(([for v1 in [for k, v in local.l3_compartments_list : v] : [for v2 in v1 : v2]])) : v3.name => {
      name                    = v3.name
      description             = v3.description
      parent_compartment_name = v3.parent_compartment_name
      compartment_id          = oci_identity_compartment.l2_compartments[v3.parent_compartment_name].id
      defined_tags            = v3.defined_tags
      freeform_tags           = v3.freeform_tags
      enable_delete           = v3.enable_delete
      sub_compartments        = v3.sub_compartments
    }
  }

  l4_compartments_list = local.l3_compartments != null ? (length(local.l3_compartments) != 0 ? flatten({
    for k, v in(local.l3_compartments != null ? local.l3_compartments : {}) : "sub_compartments" => {
      for k1, v1 in(v["sub_compartments"] != null ? v["sub_compartments"] : {}) : k1 => {
        description             = v1.description
        name                    = k1
        parent_compartment_name = k
        defined_tags            = v1.defined_tags
        freeform_tags           = v1.freeform_tags
        enable_delete           = v1.enable_delete
        sub_compartments        = v1.sub_compartments
      }
    }...
  }["sub_compartments"]) : []) : []

  l4_compartments = {
    for v3 in flatten(([for v1 in [for k, v in local.l4_compartments_list : v] : [for v2 in v1 : v2]])) : v3.name => {
      name                    = v3.name
      description             = v3.description
      parent_compartment_name = v3.parent_compartment_name
      compartment_id          = oci_identity_compartment.l3_compartments[v3.parent_compartment_name].id
      defined_tags            = v3.defined_tags
      freeform_tags           = v3.freeform_tags
      enable_delete           = v3.enable_delete
      sub_compartments        = v3.sub_compartments
    }
  }

  l5_compartments_list = local.l4_compartments != null ? (length(local.l4_compartments) != 0 ? flatten({
    for k, v in(local.l4_compartments != null ? local.l4_compartments : {}) : "sub_compartments" => {
      for k1, v1 in(v["sub_compartments"] != null ? v["sub_compartments"] : {}) : k1 => {
        description             = v1.description
        name                    = k1
        parent_compartment_name = k
        defined_tags            = v1.defined_tags
        freeform_tags           = v1.freeform_tags
        enable_delete           = v1.enable_delete
        sub_compartments        = v1.sub_compartments
      }
    }...
  }["sub_compartments"]) : []) : []

  l5_compartments = {
    for v3 in flatten(([for v1 in [for k, v in local.l5_compartments_list : v] : [for v2 in v1 : v2]])) : v3.name => {
      name                    = v3.name
      description             = v3.description
      parent_compartment_name = v3.parent_compartment_name
      compartment_id          = oci_identity_compartment.l4_compartments[v3.parent_compartment_name].id
      defined_tags            = v3.defined_tags
      freeform_tags           = v3.freeform_tags
      enable_delete           = v3.enable_delete
      sub_compartments        = v3.sub_compartments
    }
  }

  l6_compartments_list = local.l5_compartments != null ? (length(local.l5_compartments) != 0 ? flatten({
    for k, v in(local.l5_compartments != null ? local.l5_compartments : {}) : "sub_compartments" => {
      for k1, v1 in(v["sub_compartments"] != null ? v["sub_compartments"] : {}) : k1 => {
        description             = v1.description
        name                    = k1
        parent_compartment_name = k
        defined_tags            = v1.defined_tags
        freeform_tags           = v1.freeform_tags
        enable_delete           = v1.enable_delete
      }
    }...
  }["sub_compartments"]) : []) : []

  l6_compartments = {
    for v3 in flatten(([for v1 in [for k, v in local.l6_compartments_list : v] : [for v2 in v1 : v2]])) : v3.name => {
      name                    = v3.name
      description             = v3.description
      parent_compartment_name = v3.parent_compartment_name
      compartment_id          = oci_identity_compartment.l5_compartments[v3.parent_compartment_name].id
      defined_tags            = v3.defined_tags
      freeform_tags           = v3.freeform_tags
      enable_delete           = v3.enable_delete
    }
  }
}


resource "oci_identity_compartment" "l1_compartments" {
  provider = oci.oci_home
  for_each = var.compartments_config != null ? (var.compartments_config.compartments != null ? var.compartments_config.compartments : {}) : {}

  #Required
  compartment_id = each.value.compartment_id != null ? each.value.compartment_id : (var.compartments_config.default_compartment_id != null ? var.compartments_config.default_compartment_id : local.default_compartment.compartment_id)
  description    = each.value.description != null ? each.value.description : local.default_compartment.description
  name           = each.key

  #Optional
  defined_tags  = each.value.defined_tags != null ? each.value.defined_tags : (var.compartments_config.default_defined_tags != null ? var.compartments_config.default_defined_tags : local.default_compartment.defined_tags)
  freeform_tags = each.value.freeform_tags != null ? each.value.freeform_tags : (var.compartments_config.default_freeform_tags != null ? var.compartments_config.default_freeform_tags : local.default_compartment.freeform_tags)
  enable_delete = each.value.enable_delete

  timeouts {
    delete = "180m"
  }
}

resource "oci_identity_compartment" "l2_compartments" {
  provider = oci.oci_home
  for_each = var.compartments_config != null ? (local.l2_compartments != null ? local.l2_compartments : {}) : {}

  #Required
  compartment_id = each.value.compartment_id != null ? each.value.compartment_id : (var.compartments_config.default_compartment_id != null ? var.compartments_config.default_compartment_id : local.default_compartment.compartment_id)
  description    = each.value.description != null ? each.value.description : local.default_compartment.description
  name           = each.key

  #Optional
  defined_tags  = each.value.defined_tags != null ? each.value.defined_tags : (var.compartments_config.default_defined_tags != null ? var.compartments_config.default_defined_tags : local.default_compartment.defined_tags)
  freeform_tags = each.value.freeform_tags != null ? each.value.freeform_tags : (var.compartments_config.default_freeform_tags != null ? var.compartments_config.default_freeform_tags : local.default_compartment.freeform_tags)
  enable_delete = each.value.enable_delete

  timeouts {
    delete = "180m"
  }
}

resource "oci_identity_compartment" "l3_compartments" {
  provider = oci.oci_home
  for_each = var.compartments_config != null ? (local.l3_compartments != null ? local.l3_compartments : {}) : {}

  #Required
  compartment_id = each.value.compartment_id != null ? each.value.compartment_id : (var.compartments_config.default_compartment_id != null ? var.compartments_config.default_compartment_id : local.default_compartment.compartment_id)
  description    = each.value.description != null ? each.value.description : local.default_compartment.description
  name           = each.key

  #Optional
  defined_tags  = each.value.defined_tags != null ? each.value.defined_tags : (var.compartments_config.default_defined_tags != null ? var.compartments_config.default_defined_tags : local.default_compartment.defined_tags)
  freeform_tags = each.value.freeform_tags != null ? each.value.freeform_tags : (var.compartments_config.default_freeform_tags != null ? var.compartments_config.default_freeform_tags : local.default_compartment.freeform_tags)
  enable_delete = each.value.enable_delete

  timeouts {
    delete = "180m"
  }

}

resource "oci_identity_compartment" "l4_compartments" {
  provider = oci.oci_home
  for_each = var.compartments_config != null ? (local.l4_compartments != null ? local.l4_compartments : {}) : {}

  #Required
  compartment_id = each.value.compartment_id != null ? each.value.compartment_id : (var.compartments_config.default_compartment_id != null ? var.compartments_config.default_compartment_id : local.default_compartment.compartment_id)
  description    = each.value.description != null ? each.value.description : local.default_compartment.description
  name           = each.key

  #Optional
  defined_tags  = each.value.defined_tags != null ? each.value.defined_tags : (var.compartments_config.default_defined_tags != null ? var.compartments_config.default_defined_tags : local.default_compartment.defined_tags)
  freeform_tags = each.value.freeform_tags != null ? each.value.freeform_tags : (var.compartments_config.default_freeform_tags != null ? var.compartments_config.default_freeform_tags : local.default_compartment.freeform_tags)
  enable_delete = each.value.enable_delete

  timeouts {
    delete = "180m"
  }
}

resource "oci_identity_compartment" "l5_compartments" {
  provider = oci.oci_home
  for_each = var.compartments_config != null ? (local.l5_compartments != null ? local.l5_compartments : {}) : {}

  #Required
  compartment_id = each.value.compartment_id != null ? each.value.compartment_id : (var.compartments_config.default_compartment_id != null ? var.compartments_config.default_compartment_id : local.default_compartment.compartment_id)
  description    = each.value.description != null ? each.value.description : local.default_compartment.description
  name           = each.key

  #Optional
  defined_tags  = each.value.defined_tags != null ? each.value.defined_tags : (var.compartments_config.default_defined_tags != null ? var.compartments_config.default_defined_tags : local.default_compartment.defined_tags)
  freeform_tags = each.value.freeform_tags != null ? each.value.freeform_tags : (var.compartments_config.default_freeform_tags != null ? var.compartments_config.default_freeform_tags : local.default_compartment.freeform_tags)
  enable_delete = each.value.enable_delete

  timeouts {
    delete = "180m"
  }
}

resource "oci_identity_compartment" "l6_compartments" {
  provider = oci.oci_home
  for_each = var.compartments_config != null ? (local.l5_compartments != null ? local.l6_compartments : {}) : {}

  #Required
  compartment_id = each.value.compartment_id != null ? each.value.compartment_id : (var.compartments_config.default_compartment_id != null ? var.compartments_config.default_compartment_id : local.default_compartment.compartment_id)
  description    = each.value.description != null ? each.value.description : local.default_compartment.description
  name           = each.key

  #Optional
  defined_tags  = each.value.defined_tags != null ? each.value.defined_tags : (var.compartments_config.default_defined_tags != null ? var.compartments_config.default_defined_tags : local.default_compartment.defined_tags)
  freeform_tags = each.value.freeform_tags != null ? each.value.freeform_tags : (var.compartments_config.default_freeform_tags != null ? var.compartments_config.default_freeform_tags : local.default_compartment.freeform_tags)
  enable_delete = each.value.enable_delete

  timeouts {
    delete = "180m"
  }

}




