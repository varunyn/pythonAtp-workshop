#running vncserver setup on oracle cloud developer image

resource "null_resource" "remote-exec" {
  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "10m"
      host        = oci_core_instance.developer_instance.public_ip
      user        = "opc"
      private_key = tls_private_key.public_private_key_pair.private_key_pem
    }
    inline = [
      "mkdir -p tmp",
      "mkdir -p atp_wallet",
    ]
  }
  provisioner "file" {
    connection {
      agent       = false
      timeout     = "1m"
      host        = oci_core_instance.developer_instance.public_ip
      user        = "opc"
      private_key = tls_private_key.public_private_key_pair.private_key_pem
    }
    source      = "../lab-resources"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod a+x /tmp/lab-resources/*.sh",
      "/tmp/lab-resources/ocd_vnc_server.sh ${var.vncpasswd}",
    ]

    on_failure = continue
    connection {
      agent       = false
      timeout     = "10m"
      host        = oci_core_instance.developer_instance.public_ip
      user        = "opc"
      private_key = tls_private_key.public_private_key_pair.private_key_pem
    }
  }
}

output "vnc_password" {
  value       = var.vncpasswd
  description = "VNC Password. Please keep a note of it."
}

