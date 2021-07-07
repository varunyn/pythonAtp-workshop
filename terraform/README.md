## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_oci"></a> [oci](#provider\_oci) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.remote-exec](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [oci_core_app_catalog_listing_resource_version_agreement.mp_image_agreement](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_app_catalog_listing_resource_version_agreement) | resource |
| [oci_core_app_catalog_subscription.mp_image_subscription](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_app_catalog_subscription) | resource |
| [oci_core_default_route_table.default-route-table-options](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_default_route_table) | resource |
| [oci_core_instance.developer_instance](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_instance) | resource |
| [oci_core_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_internet_gateway) | resource |
| [oci_core_security_list.securitylist1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_security_list) | resource |
| [oci_core_subnet.test_subnet](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_subnet) | resource |
| [oci_core_vcn.py4devvcn](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_vcn) | resource |
| [oci_database_autonomous_database.test_autonomous_database](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/database_autonomous_database) | resource |
| [oci_identity_compartment.python4dev](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_compartment) | resource |
| [oci_objectstorage_bucket.storage_bucket](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/objectstorage_bucket) | resource |
| [tls_private_key.public_private_key_pair](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [oci_core_app_catalog_listing_resource_versions.test_CloudDevImg_catalog_listing_resource_versions](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_app_catalog_listing_resource_versions) | data source |
| [oci_core_app_catalog_listings.CloudDevImg_catalog_listings](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_app_catalog_listings) | data source |
| [oci_core_app_catalog_subscriptions.CloudDevImg_catalog_subscriptions](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_app_catalog_subscriptions) | data source |
| [oci_identity_availability_domains.ADs](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_availability_domains) | data source |
| [oci_objectstorage_namespace.ns](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/objectstorage_namespace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autonomous_database_admin_password"></a> [autonomous\_database\_admin\_password](#input\_autonomous\_database\_admin\_password) | n/a | `string` | `""` | no |
| <a name="input_autonomous_database_cpu_core_count"></a> [autonomous\_database\_cpu\_core\_count](#input\_autonomous\_database\_cpu\_core\_count) | n/a | `string` | `"1"` | no |
| <a name="input_autonomous_database_data_storage_size_in_tbs"></a> [autonomous\_database\_data\_storage\_size\_in\_tbs](#input\_autonomous\_database\_data\_storage\_size\_in\_tbs) | n/a | `string` | `"1"` | no |
| <a name="input_autonomous_database_db_name"></a> [autonomous\_database\_db\_name](#input\_autonomous\_database\_db\_name) | n/a | `string` | `"orcl4py"` | no |
| <a name="input_autonomous_database_db_workload"></a> [autonomous\_database\_db\_workload](#input\_autonomous\_database\_db\_workload) | n/a | `string` | `"OLTP"` | no |
| <a name="input_autonomous_database_display_name"></a> [autonomous\_database\_display\_name](#input\_autonomous\_database\_display\_name) | #######################DATABASE######################## | `string` | `"AlphaOffice"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Object storage name to create bucket. | `string` | `"py4dev"` | no |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | Compartment OCID where the resources will be created. | `any` | n/a | yes |
| <a name="input_instance_display_name"></a> [instance\_display\_name](#input\_instance\_display\_name) | n/a | `string` | `"AlphaOffice"` | no |
| <a name="input_instance_shape"></a> [instance\_shape](#input\_instance\_shape) | n/a | `string` | `"VM.Standard2.1"` | no |
| <a name="input_internet_gateway_display_name"></a> [internet\_gateway\_display\_name](#input\_internet\_gateway\_display\_name) | n/a | `string` | `"internet_gateway"` | no |
| <a name="input_oci_identity_availability_domain"></a> [oci\_identity\_availability\_domain](#input\_oci\_identity\_availability\_domain) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | #######################GOVERNANCE######################## | `any` | n/a | yes |
| <a name="input_subnet_display_name"></a> [subnet\_display\_name](#input\_subnet\_display\_name) | n/a | `string` | `"py4devSubnet"` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | n/a | `any` | n/a | yes |
| <a name="input_use_marketplace_image"></a> [use\_marketplace\_image](#input\_use\_marketplace\_image) | n/a | `number` | `1` | no |
| <a name="input_vcn_display_name"></a> [vcn\_display\_name](#input\_vcn\_display\_name) | #######################NETWORKING######################## | `string` | `"py4devvcn"` | no |
| <a name="input_vncpasswd"></a> [vncpasswd](#input\_vncpasswd) | #######################COMPUTE######################## | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_password"></a> [database\_password](#output\_database\_password) | Database Password. Please keep a note of it. |
| <a name="output_instance_public_ips"></a> [instance\_public\_ips](#output\_instance\_public\_ips) | Public IP address of the Compute Instance |
| <a name="output_instance_ssh_keys"></a> [instance\_ssh\_keys](#output\_instance\_ssh\_keys) | Please copy and save the private key to ssh in compute instance |
| <a name="output_subscriptions"></a> [subscriptions](#output\_subscriptions) | n/a |
| <a name="output_vnc_password"></a> [vnc\_password](#output\_vnc\_password) | VNC Password. Please keep a note of it. |
