resource "tls_private_key" "public_private_key_pair" {
  algorithm = "RSA"
}

# Dictionary Locals
locals {
  compute_flexible_shapes = [
    "VM.Standard.E3.Flex",
    "VM.Standard.E4.Flex",
    "VM.Standard.A1.Flex",
    "VM.Optimized3.Flex"
  ]
}

# Checks if is using Flexible Compute Shapes
locals {
  is_flexible_node_shape = contains(local.compute_flexible_shapes, var.instance_shape)
}

resource "oci_core_instance" "developer_instance" {
  availability_domain = var.oci_identity_availability_domain == "" ? data.oci_identity_availability_domains.ADs.availability_domains[0]["name"] : var.oci_identity_availability_domain
  compartment_id      = var.compartment_ocid
  display_name        = var.instance_display_name
  shape               = var.instance_shape

  metadata = {
    ssh_authorized_keys = var.ssh_public_key == "" ? tls_private_key.public_private_key_pair.public_key_openssh : var.ssh_public_key
  }

  dynamic "shape_config" {
    for_each = local.is_flexible_node_shape ? [1] : []
    content {
      memory_in_gbs = var.InstanceFlexShapeMemory
      ocpus         = var.InstanceFlexShapeOCPUS
    }
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_app_catalog_subscriptions.CloudDevImg_catalog_subscriptions.app_catalog_subscriptions[0]["listing_resource_id"]
  }



  create_vnic_details {
    assign_public_ip = true
    display_name     = "primaryVnic"
    subnet_id        = oci_core_subnet.test_subnet.id
    hostname_label   = "instance"
  }
  depends_on = [oci_core_vcn.py4devvcn]
}

output "instance_public_ips" {
  value       = oci_core_instance.developer_instance.*.public_ip
  description = "Public IP address of the Compute Instance"
}

output "instance_ssh_keys" {
  value       = tls_private_key.public_private_key_pair.private_key_pem
  description = "Please copy and save the private key to ssh in compute instance"
}

