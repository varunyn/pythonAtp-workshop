data "oci_objectstorage_namespace" "ns" {
}

resource "oci_objectstorage_bucket" "pythonatp" {
  #Required
  compartment_id = var.compartment_ocid
  name           = var.bucket_name
  namespace      = data.oci_objectstorage_namespace.ns.namespace
}
resource "oci_objectstorage_object" "pythonatp_wallet" {
  bucket    = oci_objectstorage_bucket.pythonatp.name
  content   = oci_database_autonomous_database_wallet.autonomous_database_wallet.content
  namespace = data.oci_objectstorage_namespace.ns.namespace
  object    = "python_atp_wallet"
}
resource "oci_objectstorage_preauthrequest" "pythonatp_wallet_preauth" {
  access_type  = "ObjectRead"
  bucket       = oci_objectstorage_bucket.pythonatp.name
  name         = "pythonatp_wallet_preauth"
  namespace    = data.oci_objectstorage_namespace.ns.namespace
  time_expires = timeadd(timestamp(), "30m")
  object_name  = oci_objectstorage_object.pythonatp_wallet.object
}

resource "oci_objectstorage_object" "lab_resource" {
  bucket    = oci_objectstorage_bucket.pythonatp.name
  source    = "./scripts/lab-resource.tar.xz"
  namespace = data.oci_objectstorage_namespace.ns.namespace
  object    = "lab-resource.tar.xz"
}
resource "oci_objectstorage_preauthrequest" "lab_resource_preauth" {
  access_type  = "ObjectRead"
  bucket       = oci_objectstorage_bucket.pythonatp.name
  name         = "lab_resource_preauth"
  namespace    = data.oci_objectstorage_namespace.ns.namespace
  time_expires = timeadd(timestamp(), "30m")
  object_name  = oci_objectstorage_object.lab_resource.object
}
