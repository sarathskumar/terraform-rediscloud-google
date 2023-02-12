module "redis-db" {
  source       = "../modules/rediscloud-database/"
  subscription_id = "PUT YOUR SUBSCRIPTION ID"
  name = var.database_name
  protocol = "redis"
  memory_limit_in_gb = var.mem_limit
  throughput_measurement_by = "operations-per-second"
  throughput_measurement_value = var.ops_per_sec_limit
  support_oss_cluster_api = false
  external_endpoint_for_oss_cluster_api = false
  replication = var.replication_enabled
  data_persistence = var.data_persistence_type
  data_eviction = var.data_eviction_type
  periodic_backup_path = var.backup_bucket_path
  average_item_size_in_bytes = 0
  source_ips = var.cidr_allow_list
  replica_of = [format("redis://%s", var.replica_endpoint)]

  alert = [{
    name = "dataset-size"
    value = 80
  }]

  modules = [{
    name = "RedisJSON"
  }]

}