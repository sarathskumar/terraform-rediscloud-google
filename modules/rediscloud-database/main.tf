# Generates a random password for the database
resource "random_password" "passwords" {
  count = 1   # this number should be equal to the number of Redis database to be created
  length = 20
  upper = true
  lower = true
  numeric = true
  special = false
}

resource "rediscloud_subscription_database" "rediscloud-database" {
  subscription_id = var.subscription_id
  name = var.name
  protocol = var.protocol
  memory_limit_in_gb = var.memory_limit_in_gb
  data_persistence = var.data_persistence
  data_eviction = var.data_eviction
  throughput_measurement_by = var.throughput_measurement_by
  throughput_measurement_value = var.throughput_measurement_value
  support_oss_cluster_api = var.support_oss_cluster_api
  external_endpoint_for_oss_cluster_api = var.external_endpoint_for_oss_cluster_api
  replication = var.replication
  average_item_size_in_bytes = var.average_item_size_in_bytes //default is 0
  password = random_password.passwords[0].result
  periodic_backup_path = var.periodic_backup_path
  source_ips = var.source_ips
  replica_of = var.replica_of
  
  dynamic "alert" {
    for_each = var.alert
    content {
      name = alert.value.name
      value = alert.value.value
    }
  }

  dynamic "modules" {
   
   for_each = var.modules
   content {
    name = modules.value.name
   }
  }

}