data "oci_objectstorage_namespace" "ns" {
}

resource "oci_objectstorage_bucket" "storage_bucket" {
  #Required
  compartment_id = var.compartment_ocid
  name           = var.bucket_name
  namespace      = data.oci_objectstorage_namespace.ns.namespace
}

