variable "autonomous_database_cpu_core_count" {
  default = "1"
}

variable "autonomous_database_data_storage_size_in_tbs" {
  default = "1"
}

variable "autonomous_database_db_workload" {
  default = "OLTP"
}

resource "oci_database_autonomous_database" "test_autonomous_database" {
  #Required
  admin_password           = var.autonomous_database_admin_password
  compartment_id           = var.compartment_ocid
  cpu_core_count           = var.autonomous_database_cpu_core_count
  data_storage_size_in_tbs = var.autonomous_database_data_storage_size_in_tbs
  db_name                  = var.autonomous_database_db_name

  #Optional
  db_workload  = var.autonomous_database_db_workload
  display_name = var.autonomous_database_display_name
}

## DB Wallet
resource "oci_database_autonomous_database_wallet" "autonomous_database_wallet" {
  autonomous_database_id = oci_database_autonomous_database.test_autonomous_database.id
  password               = random_string.autonomous_database_wallet_password.result
  generate_type          = var.autonomous_database_wallet_generate_type
  base64_encode_content  = true
}

output "database_password" {
  value       = var.autonomous_database_admin_password
  description = "Database Password. Please keep a note of it."
}

