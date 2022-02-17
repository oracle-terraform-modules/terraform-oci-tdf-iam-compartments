# Copyright (c) 2020, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


module "oci_iam_compartments" {

  source = "../../"

  providers = {
    oci.oci_home = oci.home
  }

  compartments_config = var.compartments_config
}
