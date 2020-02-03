# Copyright (c) 2020, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


#########################
## Compartments
#########################

output "compartment_1" {
  description = "Compartment 1:"
  value       = { compartments = module.compartment_1.compartments_config, home_region = [for i in data.oci_identity_region_subscriptions.this.region_subscriptions : i.region_name if i.is_home_region == true][0] }
}

output "compartment_2" {
  description = "Compartment 2:"
  value       = { compartments = module.compartment_2.compartments_config, home_region = [for i in data.oci_identity_region_subscriptions.this.region_subscriptions : i.region_name if i.is_home_region == true][0] }
}

output "compartment_3" {
  description = "Compartment 3:"
  value       = { compartments = module.compartment_3.compartments_config, home_region = [for i in data.oci_identity_region_subscriptions.this.region_subscriptions : i.region_name if i.is_home_region == true][0] }
}

output "compartment_4" {
  description = "Compartment 4:"
  value       = { compartments = module.compartment_4.compartments_config, home_region = [for i in data.oci_identity_region_subscriptions.this.region_subscriptions : i.region_name if i.is_home_region == true][0] }
}

output "compartment_5" {
  description = "Compartment 5:"
  value       = { compartments = module.compartment_5.compartments_config, home_region = [for i in data.oci_identity_region_subscriptions.this.region_subscriptions : i.region_name if i.is_home_region == true][0] }
}

output "compartment_6" {
  description = "Compartment 6:"
  value       = { compartments = module.compartment_6.compartments_config, home_region = [for i in data.oci_identity_region_subscriptions.this.region_subscriptions : i.region_name if i.is_home_region == true][0] }
}