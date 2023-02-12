variable "name" {
  type = string
  default = ""
}

variable "subscription_id" { 
    type = string
    default = ""
}

variable "protocol" {
    type =  string
    default = "redis"
}

variable "memory_limit_in_gb" {
  type = number
  default = 1
}

variable "throughput_measurement_value" {
  type = number
  default = 1000
}

variable "throughput_measurement_by" {
    type = string
    default = "operations-per-second"
}

variable "support_oss_cluster_api" {
    type = bool
    default = false
}

variable "external_endpoint_for_oss_cluster_api" {
    type = bool 
    default = false
}

variable "average_item_size_in_bytes" {
    type = number
    default = 0
}



variable "source_ips" {
  type = list
  default = []
}

variable "replication" {
  type = bool
  default = false
}

variable "data_persistence" {
  type =  string
  default = ""
}

variable "data_eviction" {
  type = string
  default = "volatile-lru"
}

variable "periodic_backup_path" {
  type = string
  default = ""
}

variable "replica_of" {
  type = any
}

variable "modules" {
    type = list(object({
        name = string
    }))
    default = []    
}

variable "alert" {
  type = list(object({
    name = string
    value = number
  }))
  default = []
}


