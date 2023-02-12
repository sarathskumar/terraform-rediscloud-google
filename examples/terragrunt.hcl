terraform {
  source  = "../modules/rediscloud-database"
}

inputs = {
   subscription_id = "PUT YOUR SUBSCRIPTION ID"
  name = database_name
  protocol = "redis"
  memory_limit_in_gb = 100
  throughput_measurement_by = "operations-per-second"
  throughput_measurement_value = 100000
  support_oss_cluster_api = false
  external_endpoint_for_oss_cluster_api = false
  replication = true
  data_persistence = "aof-every-1-second"
  data_eviction = "volatile-lru"
  periodic_backup_path = "backup_bucket_path"
  average_item_size_in_bytes = 0
  source_ips = ["1.2.3.4/14","5.6.7.8/32"]
  replica_of = [format("redis://%s", var.replica_endpoint)]

  alert = [{
    name = "dataset-size"
    value = 80
  }]

  modules = [{
    name = "RedisJSON"
  }]
}