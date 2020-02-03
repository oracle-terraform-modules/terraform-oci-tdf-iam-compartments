# Copyright (c) 2020, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


module "compartment_1" {

  source = "../../"

  providers = {
    oci.oci_home = "oci"
  }

  compartments_config = {
    default_compartment_id = var.sub_compartments_config.master_comp_parent_compartment_id
    default_defined_tags   = var.sub_compartments_config.default_defined_tags
    default_freeform_tags  = var.sub_compartments_config.default_freeform_tags
    compartments = {
      compartment_1 = {
        description    = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[0]].description
        compartment_id = var.sub_compartments_config.master_comp_parent_compartment_id
        defined_tags   = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[0]].defined_tags
        freeform_tags  = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[0]].freeform_tags
      }
    }
  }
}

module "compartment_2" {

  source = "../../"

  providers = {
    oci.oci_home = "oci"
  }
  compartments_config = {
    default_compartment_id = module.compartment_1.compartments_config[keys(var.sub_compartments_config.compartments)[0]].id
    default_defined_tags   = var.sub_compartments_config.default_defined_tags
    default_freeform_tags  = var.sub_compartments_config.default_freeform_tags
    compartments = {
      compartment_2 = {
        description    = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[1]].description
        compartment_id = module.compartment_1.compartments_config[keys(var.sub_compartments_config.compartments)[0]].id
        defined_tags   = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[1]].defined_tags
        freeform_tags  = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[1]].freeform_tags
      }
    }
  }
}


module "compartment_3" {

  source = "../../"

  providers = {
    oci.oci_home = "oci"
  }

  compartments_config = {
    default_compartment_id = module.compartment_2.compartments_config[keys(var.sub_compartments_config.compartments)[1]].id
    default_defined_tags   = var.sub_compartments_config.default_defined_tags
    default_freeform_tags  = var.sub_compartments_config.default_freeform_tags
    compartments = {
      compartment_3 = {
        description    = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[2]].description
        compartment_id = module.compartment_2.compartments_config[keys(var.sub_compartments_config.compartments)[1]].id
        defined_tags   = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[2]].defined_tags
        freeform_tags  = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[2]].freeform_tags
      }
    }
  }
}

module "compartment_4" {

  source = "../../"

  providers = {
    oci.oci_home = "oci"
  }

  compartments_config = {
    default_compartment_id = module.compartment_3.compartments_config[keys(var.sub_compartments_config.compartments)[2]].id
    default_defined_tags   = var.sub_compartments_config.default_defined_tags
    default_freeform_tags  = var.sub_compartments_config.default_freeform_tags
    compartments = {
      compartment_4 = {
        description    = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[3]].description
        compartment_id = module.compartment_3.compartments_config[keys(var.sub_compartments_config.compartments)[2]].id
        defined_tags   = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[3]].defined_tags
        freeform_tags  = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[3]].freeform_tags
      }
    }
  }
}


module "compartment_5" {

  source = "../../"

  providers = {
    oci.oci_home = "oci"
  }

  compartments_config = {
    default_compartment_id = module.compartment_4.compartments_config[keys(var.sub_compartments_config.compartments)[3]].id
    default_defined_tags   = var.sub_compartments_config.default_defined_tags
    default_freeform_tags  = var.sub_compartments_config.default_freeform_tags
    compartments = {
      compartment_5 = {
        description    = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[4]].description
        compartment_id = module.compartment_4.compartments_config[keys(var.sub_compartments_config.compartments)[3]].id
        defined_tags   = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[4]].defined_tags
        freeform_tags  = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[4]].freeform_tags
      }
    }
  }
}

module "compartment_6" {

  source = "../../"

  providers = {
    oci.oci_home = "oci"
  }

  compartments_config = {
    default_compartment_id = module.compartment_5.compartments_config[keys(var.sub_compartments_config.compartments)[4]].id
    default_defined_tags   = var.sub_compartments_config.default_defined_tags
    default_freeform_tags  = var.sub_compartments_config.default_freeform_tags
    compartments = {
      compartment_6 = {
        description    = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[5]].description
        compartment_id = module.compartment_5.compartments_config[keys(var.sub_compartments_config.compartments)[4]].id
        defined_tags   = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[5]].defined_tags
        freeform_tags  = var.sub_compartments_config.compartments[keys(var.sub_compartments_config.compartments)[5]].freeform_tags
      }
    }
  }
}
