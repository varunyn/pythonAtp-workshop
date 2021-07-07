terraform {
  required_version = ">= 0.14.0"
}
provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  region       = var.region
}

