# Get list of availability domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

### Passwords using random_string instead of random_password to be compatible with ORM (Need to update random provider)
resource "random_string" "autonomous_database_wallet_password" {
  length           = 16
  special          = true
  min_upper        = 3
  min_lower        = 3
  min_numeric      = 3
  min_special      = 3
  override_special = "{}#^*<>[]%~"
}

# Cloud Init
data "template_cloudinit_config" "cloud_init" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "cloud-config.yaml"
    content_type = "text/cloud-config"
    content      = local.cloud_init
  }
}

locals {
  deploy_template = templatefile("${path.module}/scripts/script.template.sh",
    {
      lab_resource_par = "https://objectstorage.${var.region}.oraclecloud.com${oci_objectstorage_preauthrequest.lab_resource_preauth.access_uri}"
      wallet_par       = "https://objectstorage.${var.region}.oraclecloud.com${oci_objectstorage_preauthrequest.pythonatp_wallet_preauth.access_uri}"
      vncpasswd        = var.vncpasswd
  })

  cloud_init = templatefile("${path.module}/scripts/cloud-config.yaml",
    {
      deploy_template = base64gzip(local.deploy_template)

  })
}
